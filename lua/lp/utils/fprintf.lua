--- Generally useful routines.
-- See  @{01-introduction.md.Generally_useful_functions|the Guide}.
--
-- @module lp.utils.fprintf
local format = string.format
local assert_string = require "lp.utils.assert_string"

--- write an arbitrary number of arguments to a file using a format.
-- @param f File handle to write to.
-- @param fmt The format (see `string.format`).
-- @param ... Extra arguments for format
-- @class function
-- @name fprintf
local function fprintf(f,fmt,...)
    assert_string(2,fmt)
    f:write(format(fmt,...))
end
return fprintf
