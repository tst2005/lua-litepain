----------------
--- On demand: 
-- This module is use to setup a module that will only require his content when it used
--
-- @module lp.micromodule.ondemand

--- create an on-demande module
-- argument1 a hash-table that contains functions to get the requested content on demand
-- @class function
-- @name ondemand
local function ondemand(getfuncs)
	local function __index(p,k)
		local getfunc = getfuncs[k]
		if getfunc then
			assert(type(getfunc)=="function", "Internal error: unable to get content, got "..type(getfunc)..", function expected")
			local v = getfunc(k)
			p[k] = v -- put in the table for a direct access (will be call again only if v==nil)
			return v
		end
	end
	return setmetatable({},{__index=__index})
end
return ondemand
