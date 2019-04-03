----------------
--- Lua 5.1/5.2/5.3 compatibility.
-- This module is use to detect the current environment (OS and VM version)
--
-- @module lp.detect


local detect = {}

--- boolean flag this is Lua 5.1 (or LuaJIT).
-- @field lua51
-- @see lp.detect.lua51
do end
--detect.lua51 = require "lp.detect.lua51"()

--- boolean flag this is LuaJIT.
-- @field jit
-- @see lp.detect.jit
do end
--detect.jit = require "lp.detect.jit"()

--- boolean flag this is LuaJIT with 5.2 compatibility compiled in.
-- @field jit52
-- @see lp.detect.jit52
do end
--detect.jit52 = require "lp.detect.jit52"()

--- the directory separator character for the current platform.
-- @field dir_separator
-- @see lp.detect.dir_separator
do end
--detect.dir_separator = require "lp.detect.dir_separator"()

--- boolean flag this is a Windows platform.
-- @field is_windows
-- @see lp.detect.is_windows
do end
--detect.is_windows = require "lp.detect.is_windows"()


-- DEPS:
local wrapper = assert(require "lp.micromodule".ondemand)
--local wrapper = assert(require "lp.micromodule".requireall) -- cross require content

local prefixrequire = require "lp.micromodule.prefixrequire"

--- Lua module does not support to remember nil or boolean value without side-effect.
-- The wanted value is encapsulated into a function.
-- After the usual require we must call the returned function to get the excepted value.
local function require_and_call(name)
	return require(name)()
end

-- create the both handlers
local v = prefixrequire("lp.detect.", require) -- the usual way
local fv = prefixrequire("lp.detect.", require_and_call) -- the special way, require then call the returned function

local getfuncs = { lua51=fv, jit=fv, jit52=fv, dir_separator=v, is_windows=fv}
local detect = wrapper(getfuncs)
return detect

