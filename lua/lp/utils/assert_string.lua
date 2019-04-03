--- Generally useful routines.
--
-- @Xmodule lp.utils.assert_string

--- assert the common case that the argument is a string.
-- @param n argument index
-- @param val a value that must be a string
-- @return the validated value
-- @raise val must be a string
-- @usage
-- local assert_string = require "lp.utils.assert_string"
-- local val = 42
-- local param2 = assert_string(2, val) --> error: argument 2 expected a 'string', got a 'number'
-- @class function
-- @name assert_string
local function assert_string (n,val)
	if type(val) ~= "string" then
		error(("argument %d expected a 'string', got a '%s'"):format(n,type(val)),3)
	else
		return val
	end
end
return assert_string
