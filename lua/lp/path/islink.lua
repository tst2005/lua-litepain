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

local link_attrib = lfs.symlinkattributes or nil

-- is this a symbolic link?
-- @string P A file path
local function path_islink(P)
    assert_string(1,P)
    return link_attrib(P,'mode')=='link'
end
-- if lfs.symlinkattributes does not exists, always return false
if not link_attrib then
	function path_islink(P)
		assert_string(1,P)
		return false
	end
end
return path_islink
