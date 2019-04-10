----------------
--- Lua 5.1/5.2/5.3 compatibility.
-- This module is use to detect the current environment (OS and VM version)
--
-- Dependencies: `lp.micromodule.ondemand`, `lp.micromodule.prefixrequire`
--
-- @module lp.detect

-- DEPS:
--local wrapper = assert(require "lp.micromodule.requireall") -- cross require content
local wrapper = assert(require "lp.micromodule.ondemand")

local prefixrequire = require "lp.micromodule.prefixrequire"

-- Lua module does not support to remember nil or boolean value without side-effect.
-- The wanted value is encapsulated into a function.
-- After the usual require we must call the returned function to get the excepted value.
local function require_and_call(name)
	return require(name)()
end

-- create the both handlers
local v = prefixrequire("lp.detect.", require) -- the usual way
local fv = prefixrequire("lp.detect.", require_and_call) -- the special way, require then call the returned function

local getfuncs = { lua51=fv, jit=fv, jit52=fv, dir_separator=v, is_windows=fv }
local detect = wrapper(getfuncs)
return detect

