-- https://devforum.roblox.com/t/requestqueue-easily-handle-rate-limits-using-promises/1353083

--[[
	
	RequestQueue by AstrealDev
	Easily handle rate limits
	
	------------------------------------------------------------------------
	
	Example:
	local HTTP = game:GetService("HttpService")

	local RequestQueue = require(script.RequestQueue)

	local catalogData = HTTP:GetAsync("https://catalog.rprxy.xyz/v1/search/items?category=Accessories&subcategory=HairAccessories&creatortargetid=1&limit=60")
	catalogData = HTTP:JSONDecode(catalogData)

	-- :GetProductInfo() has a rate limit of 100 requests per minute so retrying every 60 seconds
	-- will fix this issue
	local queue = RequestQueue.new(true, RequestQueue.RejectionHandling.RETRY, 60)

	-- Called upon a queue being fully resolved
	queue:resolved(function(data)
		print(data)
	end)

	for _, v in pairs(catalogData.data) do
		queue:enqueue(function(id, infoType)
			return game:GetService('MarketplaceService'):GetProductInfo(id, infoType)
		end, v.id, Enum.InfoType.Asset)
	end

]]

local Promise = require(script.Parent.Promise)
local RequestQueue = {
	RejectionHandling = {
		FAIL = 0,	-- FAIL:	Will error if an enqueue fails
		WARN = 1,	-- WARN:	Will warn if an enqueue fails
		RETRY = 2	-- RETRY:	Will attempt to retry an enqueue by deferring it based on provided retryRate
	},
}
local QueueClass = {}

--[[
	Get a new Queue object
]]
function RequestQueue.new(debugEnabled: boolean?, rejectionHandling: number?, retryRate: number?, maxRetries: number?)
	local self = setmetatable({}, {__index = QueueClass})

	self._rejectionHandling = rejectionHandling
		and (rejectionHandling >= 3 or rejectionHandling < 0)
		and 0
		or rejectionHandling
		or RequestQueue.RejectionHandling.FAIL
	self._queued = 0
	self._resolved = {}
	self._debug = debugEnabled or false
	self._retries = 0
	self._maxRetries = maxRetries or math.huge
	self._retryRate = (self._rejectionHandling == RequestQueue.RejectionHandling.RETRY) and (retryRate or 15) or 15

	return self
end

--[[
	Enqueue a request
]]
function QueueClass:enqueue(handler, ...)
	local params = {...}

	self._queued += 1

	local result
	local promise = Promise.new(function(resolve, reject)
		local success, err = pcall(function()
			result = handler(unpack(params))
		end)
		if (success) then
			resolve(result)
		else
			reject(err)
		end
	end)

	promise:andThen(function(res)
		if (self._debug) then print('Enqueue was successful') end
		self._queued -= 1

		table.insert(self._resolved, res)
	end):catch(function(err)
		if (self._rejectionHandling == RequestQueue.RejectionHandling.FAIL) then 
			error(err)
		elseif (self._rejectionHandling == RequestQueue.RejectionHandling.WARN or self._debug) then
			warn('Enqueue failed | ' .. err)
		end

		self._queued -= 1

		if (self._rejectionHandling == RequestQueue.RejectionHandling.RETRY) then
			if (self._retries > self._maxRetries) then
				warn(string.format('Enqueue has failed over %d times and will potentially never resolve.', self._maxRetries))
			end

			self:deferredEnqueue(self._retryRate, handler, unpack(params))

			self._retries += 1
		end
	end):finally(function()
		if (self._queued == 0) then
			if (self._onResolution) then
				local returnData = self._resolved

				-- if (#returnData == 1) then
				-- 	returnData = returnData[1]
				-- elseif (returnData == 0) then
				-- 	returnData = nil
				-- end

				self._onResolution(returnData)
			end
		end
	end)

	return promise
end

--[[
	Defer a request then enqueue it
]]
function QueueClass:deferredEnqueue(seconds: number, handler, ...)
	local params = {...}

	Promise.delay(seconds):andThen(function()
		self:enqueue(handler, unpack(params))
	end)
end

--[[
	Hook a callback to be called whenever all requests in the queue are fully resolved
]]
function QueueClass:resolved(callback: (resolvedRequests: { any }) -> void)
	self._onResolution = callback or (function() end)
end

return RequestQueue