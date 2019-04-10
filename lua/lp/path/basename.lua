---
-- Dependencies: `lp.utils.assert_string`, `FIXME`
-- @submodule lp.path

local assert_string = require "lp.utils.assert_string"
local splitpath = require "lp.path.splitpath"

--- return the file part of a path
-- @string P A file path
-- @function basename
local function basename(P)
    assert_string(1,P)
    local _,p2 = splitpath(P)
    return p2
end
return basename
