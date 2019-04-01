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

local ondemand = assert(require "lp.micromodule".ondemand)
local detect = ondemand("lp.detect.", {lua51=true, jit=true, jit52=true, dir_separator=false, is_windows=true}, true)
return detect

