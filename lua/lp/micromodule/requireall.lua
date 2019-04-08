--- Basic wrapper: create a module with all his content required before the first use.
-- This module is use to setup a module that will basically require all his content.
-- It is the exact opposit approach of `lp.micromodule.ondemand`.
--
-- @submodule lp.micromodule

--- The require-all wrapper
-- ...
-- @param getfuncs a hashmap table, each field contains the function to get the appropriate entry
-- @class function
-- @name requireall
local function requireall(getfuncs)
	local p = {}
	for k,getfunc in pairs(getfuncs) do
		if getfunc then
			assert(type(getfunc)=="function", "Internal error: unable to get content, got "..type(getfunc)..", function expected")
			p[k]= getfunc(k)
		end
	end
	return p
end
return requireall
