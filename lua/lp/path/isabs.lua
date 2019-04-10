--- 
-- Dependencies: `lp.utils.assert_string`, `FIXME`
-- @submodule lp.path

local assert_string = require "lp.utils.assert_string"
local is_windows = require "lp.path.is_windows"
 local sub = string.sub
local function at(s,k) return s:sub(k,k) end

--- is this an absolute path?.
-- @string P A file path
-- @function isabs
local isabs
if is_windows then
function isabs(P)
    assert_string(1,P)
    return at(P,1) == '/' or at(P,1)=='\\' or at(P,2)==':'
end
else
function isabs(P)
    assert_string(1,P)
    return at(P,1) == '/'
end
end
return isabs
