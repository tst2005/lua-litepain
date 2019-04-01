--- Generally useful routines.
--
-- @module lp.utils.assert_string

local assert_arg = require "lp.utils.assert_arg"

--- assert the common case that the argument is a string.
-- @param n argument index
-- @param val a value that must be a string
-- @return the validated value
-- @raise val must be a string
-- @usage
-- local val = 42
-- local param2 = lp.utils.assert_string(2, val) --> error: argument 2 expected a 'string', got a 'number'
-- @class function
-- @name assert_string
local function assert_string (n, val)
    return assert_arg(n,val,'string',nil,nil,3)
end
return assert_string
