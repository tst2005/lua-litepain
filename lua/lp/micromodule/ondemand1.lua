----------------
--- On demand: 
-- This module is use to setup a module that will only require his content when it used
--
-- @module lp.micromodule.ondemand

-- sample 1:
-- local allow = {lua51="v", jit="v", jit52="v", dir_separator="v", is_windows="v"}
-- return wrapper("lp.detect.", allow, function(v,allowed) if allowed=="v" return v() end return v end)
--
-- sample 2:
--local allow = {lua51=true, jit=true, jit52=true, dir_separator=true, is_windows=true}
--return wrapper("lp.detect.", allow, true)

--- create an on-demande module
-- @class function
-- @name ondemand
local function ondemand(modnameprefix, allow, filter)
	local __index
	if filter then
		function __index(p,k)
			local allowed = allow[k]
			if allowed~=nil then
				local v = require(modnameprefix..k)
				if filter then
					v = filter(v, allowed)
				end
				p[k] = v -- put in the table for a direct access (will be call again only if v==nil)
				return v
			end
		end
	else
		function __index(p,k)
			local allowed = allow[k]
			if allowed~=nil then
				local v = require(modnameprefix..k)
				p[k] = v -- put in the table for a direct access (will be call again only if v==nil)
				return v
			end
		end
	end
	return setmetatable({},{__index=__index})
end
return ondemand
