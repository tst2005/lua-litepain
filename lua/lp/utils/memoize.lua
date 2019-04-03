--- Generally useful routines.
-- See  @{01-introduction.md.Generally_useful_functions|the Guide}.
--
-- @module lp.utils.memoize


--- Functional
-- @section functional

--- 'memoize' a function (cache returned value for next call).
-- This is useful if you have a function which is relatively expensive,
-- but you don't know in advance what values will be required, so
-- building a table upfront is wasteful/impossible.
-- @param func a function of at least one argument
-- @return a function with at least one argument, which is used as the key.
-- @class function
-- @name memoize
local function memoize(func)
    local cache = {}
    return function(k)
        local res = cache[k]
        if res == nil then
            res = func(k)
            cache[k] = res
        end
        return res
    end
end
return memoize
