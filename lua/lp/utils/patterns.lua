---
-- Dependencies: none.
--
-- @submodule lp.utils

--- Some standard patterns
-- @table patterns
local patterns = {
    FLOAT = '[%+%-%d]%d*%.?%d*[eE]?[%+%-]?%d*', -- floating point number
    INTEGER = '[+%-%d]%d*',                     -- integer number
    IDEN = '[%a_][%w_]*',                       -- identifier
    FILE = '[%a%.\\][:%][%w%._%-\\]*',          -- file
}

return patterns
