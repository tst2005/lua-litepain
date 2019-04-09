---
--
-- Dependencies: `pl.utils`, `lfs`
-- @submodule lp.path

-- imports and locals
local assert_string = require "lp.utils.assert_string"
local sub = string.sub
local function at(s,k)  return s:sub(k,k) end

--- given a path, return the root part and the extension part.
-- if there's no extension part, the second value will be empty
-- @string P A file path
-- @treturn string root part
-- @treturn string extension part (maybe empty)
-- @function splitext
local function splitext(P)
    assert_string(1,P)
    local i = #P
    local ch = at(P,i)
    while i > 0 and ch ~= '.' do
        if ch == sep or ch == other_sep then
            return P,''
        end
        i = i - 1
        ch = at(P,i)
    end
    if i == 0 then
        return P,''
    else
        return sub(P,1,i-1),sub(P,i)
    end
end
return splitext
