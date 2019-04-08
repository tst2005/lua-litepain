---
-- Dependencies: `lp.utils.assert_string`, `lp.utils.fprintf`
--
-- @submodule lp.utils
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
