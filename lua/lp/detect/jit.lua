--- micro-module of `lp.detect`
-- @submodule lp.detect
-- @set no_summary=true

--- boolean flag this is LuaJIT.
-- @field jit
-- @class field
-- @name jit
local jit = (tostring(assert):match('builtin') ~= nil)
return function() return jit end
