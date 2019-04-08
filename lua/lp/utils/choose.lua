---
-- Dependencies: none
--
-- @submodule lp.utils

--- return either of two values, depending on a condition.
-- @param cond A condition
-- @param value1 Value returned if cond is truthy
-- @param value2 Value returned if cond is falsy
-- @function choose
local function choose(cond, value1, value2)
    return cond and value1 or value2
end
return choose
