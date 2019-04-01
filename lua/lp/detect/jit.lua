--- micro-module of `lp.detect`
-- @module lp.detect.jit

--- boolean flag this is LuaJIT.
-- @field jit
-- @class field
-- @name jit
local jit = (tostring(assert):match('builtin') ~= nil)
return function() return jit end
