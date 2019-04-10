--- micro-module of `lp.detect`
-- @submodule lp.detect
-- @set no_summary=true

local dir_separator = require "lp.detect.dir_separator"

--- boolean flag this is a Windows platform.
-- @field is_windows
-- @class field
-- @name is_windows
local is_windows = dir_separator == '\\'
return function() return is_windows end
