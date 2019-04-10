--- Low level function that can be used for `lp.micromodule.ondemand` or `lp.micromodule.requireall`
-- Dependencies: none.
-- @submodule lp.micromodule

--- A helper to create a require function that will add a prefix to the module name
-- @param prefix the module name prefix (usualy ending by '.')
-- @param require the function use when a module is require (usualy the standard `require` function)
-- @func require the require function (usualy the `_G.require`)
-- @function prefixrequire
local function prefixrequire(prefix, require)
        return function(k)
		return require(prefix..k)
	end
end               
return prefixrequire
