--- Generally useful routines.
-- See  @{01-introduction.md.Generally_useful_functions|the Guide}.
--
-- Dependencies: `lp.compat`, all exported fields and functions from
-- `lp.compat` are also available in this module.
--
-- @module lp.utils.printf
local assert_string = require "lp.utils.assert_string"
local fprintf = require "lp.utils.fprintf"

--- print an arbitrary number of arguments using a format.
-- Output will be sent to `stdout`.
-- @param fmt The format (see `string.format`)
-- @param ... Extra arguments for format
-- @function printf
local function printf(fmt, ...)
    assert_string(1, fmt)
    fprintf(stdout, fmt, ...)
end
return printf
