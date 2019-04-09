---
-- Dependencies: `lp.utils.assert_string`
-- @submodule lp.path

-- imports and locals
local assert_string = require "lp.utils.assert_string"
local sub = string.sub
local function at(s,k)  return s:sub(k,k) end

--- given a path, return the directory part and a file part.
-- if there's no directory part, the first value will be empty
-- @string P A file path
-- @function splitpath
return function(P)
    assert_string(1,P)
    local i = #P
    local ch = at(P,i)
    while i > 0 and ch ~= sep and ch ~= other_sep do
        i = i - 1
        ch = at(P,i)
    end
    if i == 0 then
        return '',P
    else
        return sub(P,1,i-1), sub(P,i+1)
    end
end
