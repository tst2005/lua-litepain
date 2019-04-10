--- Path manipulation and file queries.
--
-- This is modelled after Python's os.path library (10.1); see @{04-paths.md|the Guide}.
--
-- Dependencies: `lp.utils`, `lfs`
-- @submodule lp.path

-- imports and locals
local _G = _G
local sub = string.sub

local assert_string = require "lp.utils.assert_string"
local dirname = require "lp.utils.dirname"
local normcase = require "lp.utils.normcase"

local function at(s,i)
	return sub(s,i,i)
end

--- return the largest common prefix path of two paths.
-- @string path1 a file path
-- @string path2 a file path
-- @function common_prefix
local function common_prefix (path1,path2)
    assert_string(1,path1)
    assert_string(2,path2)
    path1, path2 = normcase(path1), normcase(path2)
    -- get them in order!
    if #path1 > #path2 then path2,path1 = path1,path2 end
    for i = 1,#path1 do
        local c1 = at(path1,i)
        if c1 ~= at(path2,i) then
            local cp = path1:sub(1,i-1) -- FIXME
            if at(path1,i-1) ~= sep then
                cp = dirname(cp)
            end
            return cp
        end
    end
    if at(path2,#path1+1) ~= sep then path1 = dirname(path1) end
    return path1
    --return ''
end
return common_prefix
