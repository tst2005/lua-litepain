--- 
-- Dependencies: `lp.utils.assert_string`, `FIXME`
-- @submodule lp.path

local assert_string = require "lp.utils.assert_string"
local splitext = require "lp.path.splitext"

--- get the extension part of a path.
-- @string P A file path
-- @function extension
local function extension(P)
    assert_string(1,P)
    local _,p2 = splitext(P) -- FIXME: use (select(2, splitext(P))) ?
    return p2
end
return extension
