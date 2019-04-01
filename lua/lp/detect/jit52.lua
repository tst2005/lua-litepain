--- micro-module of `lp.detect`
-- @module lp.detect.jit52

--- boolean flag this is LuaJIT with 5.2 compatibility compiled in.
-- @field jit52
-- @class field
-- @name jit52
local jit52
if require "lp.detect".jit then
    -- 'goto' is a keyword when 52 compatibility is enabled in LuaJit
    jit52 = not ((loadstring or load)("local goto = 1"))
end
return function() return jit52 end
