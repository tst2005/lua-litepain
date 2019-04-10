--- 
-- Dependencies: `lp.utils.assert_string`, `FIXME`
-- @submodule lp.path

local assert_string = require "lp.utils.assert_string"
local isabs = require "lp.path.isabs"
local join = require "lp.path.join"
 local sub = string.sub
local function at(s,k) return s:sub(k,k) end
local select = select

assert(path.sep)

--- return the path resulting from combining the individual paths.
-- if the second (or later) path is absolute, we return the last absolute path (joined with any non-absolute paths following).
-- empty elements (except the last) will be ignored.
-- @string p1 A file path
-- @string p2 A file path
-- @string ... more file paths
-- @function join
local function join(p1,p2,...)
    assert_string(1,p1)
    assert_string(2,p2)
    if select('#',...) > 0 then
        local p = join(p1,p2)
        local args = {...}
        for i = 1,#args do
            assert_string(i,args[i])
            p = join(p,args[i])
        end
        return p
    end
    if isabs(p2) then return p2 end
    local endc = at(p1,#p1)
    if endc ~= path.sep and endc ~= other_sep and endc ~= "" then
        p1 = p1..path.sep -- FIXME path.sep ?
    end
    return p1..p2
end
return join
