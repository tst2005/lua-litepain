--- Generally useful routines.
-- See  @{01-introduction.md.Generally_useful_functions|the Guide}.
--
-- Dependencies: `lp.compat`, all exported fields and functions from
-- `lp.compat` are also available in this module.
--
-- @Xmodule lp.utils.bind2
local function_arg = require "lp.utils.function_arg"

--- bind the second argument of the function to a value.
-- @param fn a function of at least two values (may be an operator string)
-- @param p a value
-- @return a function such that f(x) is fn(x,p)
-- @raise same as @{function_arg}
-- @usage
-- local function f(a, b, c)
--   print(a .. " " .. b .. " " .. c)
-- end
--
-- local hello = utils.bind1(f, "world")
--
-- print(hello("Hello", "!"))  --> "Hello world !"
-- print(hello("Bye", "?"))    --> "Bye world ?"
local function bind2 (fn,p)
    fn = utils.function_arg(1,fn)
    return function(x,...) return fn(x,p,...) end
end
return bind2
