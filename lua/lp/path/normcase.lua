---
-- Dependencies: `lp.utils.assert_string`, `lp.detect.is_windows`
-- @submodule lp.path

-- imports and locals
local assert_string = require "pl.utils.assert_string"
local is_windows = require "lp.detect.is_windows"

--- normalize the case of a pathname. On Unix, this returns the path unchanged;
--  for Windows, it converts the path to lowercase, and it also converts forward slashes
-- to backward slashes.
-- @string P A file path
-- @function normcase
local function normcase(P)
    assert_string(1,P)
    if is_windows then
        return (P:lower():gsub('/','\\'))
    else
        return P
    end
end
return normcase
