--- Low level function used by `lp.micromodule.ondemand`
-- @module lp.micromodule.ondemand.mkloader

--- xx
-- @class function
-- @name mkloader
local function mkloader(prefix, require)
        return function(k)
		return require(prefix..k)
	end
end               
return mkloader
