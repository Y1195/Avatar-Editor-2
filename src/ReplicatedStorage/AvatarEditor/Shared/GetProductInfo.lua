local Marketplace = game:GetService("MarketplaceService")

local Cache = require(script.Parent.Cache)
local Settings = require(script.Parent.Settings)
local Promise = require(script.Parent.Util.Promise)

local cache = Cache.new(Settings.PRODUCT_INFO_CACHE_SIZE)


local function getProductInfo(assetId)
	assert(typeof(assetId) == "number")
	
	local cached = cache:Get(tostring(assetId))
	if cached then
		return Promise.resolve(cached)
	end
	
	return Promise.new(function(resolve, reject)
		local success, result = pcall(function()
			return Marketplace:GetProductInfo(assetId)
		end)
		if success then
			cache:Set(tostring(assetId), result)
			resolve(result)
		else
			reject(result)
		end
	end)
end


return getProductInfo