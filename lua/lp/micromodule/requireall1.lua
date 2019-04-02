--- Basic wrapper: create a module with all his content required before the first use.
-- This module is use to setup a module that will basically require all his content.
-- It is the exact opposit approach of `lp.micromodule.ondemand`.
--
-- @module lp.micromodule.requireall

--- The require-all wrapper
-- ...
-- @class function
-- @name requireall
local function requireall(modnameprefix, allow, filter)
	local p = {}
	for k,allowed in pairs(allow) do
		local v = require(modnameprefix..k)
		if filter then
			v = filter(v, allowed)
		end
		p[k] = v
	end
	return p
end
return requireall
