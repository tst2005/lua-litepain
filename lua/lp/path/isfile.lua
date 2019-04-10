---
-- Dependencies: `lp.utils.assert_string`, `lfs`
-- @submodule lp.path

-- imports and locals
local _G = _G
local assert_string = require "lp.utils.assert_string"

local lfs = require("lfs")

local attrib = lfs.attributes

--- is this a file?.
-- @string P A file path
-- @class function
-- @name isfile
local function isfile(P)
    assert_string(1,P)
    return attrib(P,'mode') == 'file'
end
return isfile
