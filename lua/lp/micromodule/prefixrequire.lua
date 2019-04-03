--- Low level function that can be used for `lp.micromodule.ondemand` or `lp.micromodule.requireall`
-- @module lp.micromodule.prefixrequire

--- A helper to create a require function that will add a prefix to the module name
-- @class function
-- @name prefixrequire
local function prefixrequire(prefix, require)
        return function(k)
		return require(prefix..k)
	end
end               
return prefixrequire
