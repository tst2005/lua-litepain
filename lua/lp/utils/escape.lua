--- Generally useful routines.
-- See  @{01-introduction.md.Generally_useful_functions|the Guide}.
--
-- Dependencies: `lp.compat`, all exported fields and functions from
-- `lp.compat` are also available in this module.
--
-- @Xmodule lp.utils.escape

--- String functions
-- @section string-functions

local assert_string = require "lp.utils.assert_string"

--- escape any Lua 'magic' characters in a string
-- @param s The input string
-- @function escape
local function escape(s)
    assert_string(1,s)
    return (s:gsub('[%-%.%+%[%]%(%)%$%^%%%?%*]','%%%1'))
end
return escape
