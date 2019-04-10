--- Path manipulation and file queries.
--
-- This is modelled after Python's os.path library (10.1); see @{04-paths.md|the Guide}.
--
-- Dependencies: `lp.utils`, `lfs`
-- @submodule lp.path

-- imports and locals
local _G = _G
local utils = require 'lp.utils'
local assert_string,raise = utils.assert_string,utils.raise

local res,lfs = _G.pcall(_G.require,'lfs')
if not res then
    error("lp.path requires LuaFileSystem")
end

local attrib = lfs.attributes

--- return size of a file.
-- @string P A file path
-- @class function
-- @name getsize
local function getsize(P)
    assert_string(1,P)
    return attrib(P,'size')
end
return getsize
