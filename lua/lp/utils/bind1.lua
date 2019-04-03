--- Generally useful routines.
-- See  @{01-introduction.md.Generally_useful_functions|the Guide}.
--
-- Dependencies: `lp.utils.function_arg`
--
-- @Xmodule lp.utils.bind1

local function_arg = require "lp.utils.function_arg"

--- bind the first argument of the function to a value.
-- @param fn a function of at least two values (may be an operator string)
-- @param p a value
-- @return a function such that f(x) is fn(p,x)
-- @raise same as @{function_arg}
-- @see func.bind1
-- @usage
-- local function f(msg, name)
--   print(msg .. " " .. name)
-- end
--
-- local hello = utils.bind1(f, "Hello")
--
-- print(hello("world"))     --> "Hello world"
-- print(hello("sunshine"))  --> "Hello sunshine"
local function bind1 (fn,p)
    fn = function_arg(1,fn)
    return function(...) return fn(p,...) end
end
return bind1
