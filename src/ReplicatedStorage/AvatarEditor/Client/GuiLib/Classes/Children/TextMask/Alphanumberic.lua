local Mask = {}

Mask.Name = "String"
Mask.Default = ""

function Mask:Process(text)
	local new = text:gsub("[%p%s]+", "")
	return new
end

function Mask:Verify(text)
	--local find = text:find("[%p%s]+")
	--if not find then
		
	--end
	return true
end

function Mask:ToType(text)
	--text = self:Verify(text) and text or self.Default
	return text
end

return Mask