--- Generally useful routines.
-- See  @{01-introduction.md.Generally_useful_functions|the Guide}.
--
-- Dependencies: `lp.compat.load`, `lp.utils.raise`, `lp.utils.memoize`
--
-- @module lp.utils.string_lambda
local load = require "lp.compat.load"
local raise = require "lp.utils.raise"

local function _string_lambda(f)
    if f:find '^|' or f:find '_' then
        local args,body = f:match '|([^|]*)|(.+)'
        if f:find '_' then
            args = '_'
            body = f
        else
            if not args then return raise 'bad string lambda' end
        end
        local fstr = 'return function('..args..') return '..body..' end'
        local fn,err = utils.load(fstr)
        if not fn then return raise(err) end
        fn = fn()
        return fn
    else
        return raise 'not a string lambda'
    end
end

local memoize = require "lp.utils.memoize"

--- an anonymous function as a string. This string is either of the form
-- '|args| expression' or is a function of one argument, '_'
-- @param lf function as a string
-- @return a function
-- @function utils.string_lambda
-- @usage
-- string_lambda '|x|x+1' (2) == 3
-- string_lambda '_+1' (2) == 3.string_lambda = utils.memoize(_string_lambda)
local string_lambda = memoize(_string_lambda)
return string_lambda
