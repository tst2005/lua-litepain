--- Low level function that can be used for `lp.micromodule.ondemand` or `lp.micromodule.requireall`
-- @submodule lp.micromodule

--- A helper to create a require function that will add a prefix to the module name
-- @str prefix the module name prefix (usualy ending by '.')
-- @func require the require function (usualy the `_G.require`)
-- @function prefixrequire
local function prefixrequire(prefix, require)
        return function(k)
		return require(prefix..k)
	end
end               
return prefixrequire
