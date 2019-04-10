--- 
-- Dependencies: `lp.utils.assert_string`, `FIXME`
-- @submodule lp.path

local assert_string = require "lp.utils.assert_string"
local splitpath = require "lp.path.splitpath"

--- return the directory part of a path
-- @string P A file path
-- @function dirname
local function dirname(P)
    assert_string(1,P)
    local p1 = splitpath(P)
    return p1
end
return dirname
