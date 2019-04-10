---
-- @submodule lp.path

-- imports and locals
local _G = _G
local assert_string = require "lp.utils.assert_string"

local lfs = require('lfs')

local attrib = lfs.attributes

--- does a path exist?.
-- @string P A file path
-- @return the file path if it exists, nil otherwise
-- @function exists
local function exists(P)
    assert_string(1,P)
    return attrib(P,'mode') ~= nil and P
end
return exists
