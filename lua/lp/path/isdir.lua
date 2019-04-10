--- Path manipulation and file queries.
--
-- This is modelled after Python's os.path library (10.1); see @{04-paths.md|the Guide}.
--
-- Dependencies: `lp.utils.assert_string`, `lfs`
-- @submodule lp.path

-- imports and locals
local assert_string = require "lp.utils.assert_string"
local attrib = require"lfs".attributes

--- is this a directory?
-- @string P A file path
-- @function isdir
local function isdir(P)
    assert_string(1,P)
    if P:match("\\$") then -- FIXME: what is this shit ?!
        P = P:sub(1,-2)
    end
    return attrib(P,'mode') == 'directory'
end
return isdir
