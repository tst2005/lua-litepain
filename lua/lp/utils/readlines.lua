--- Generally useful routines.
-- See  @{01-introduction.md.Generally_useful_functions|the Guide}.
--
-- Dependencies: `lp.compat`, all exported fields and functions from
-- `lp.compat` are also available in this module.
--
-- @module lp.utils.readlines

local assert_string = require "lp.utils.assert_string"
local io = io -- io.open
local raise = "lp.utils.raise"
local append = table.insert

--- return the contents of a file as a list of lines
-- @param filename The file path
-- @return file contents as a table
-- @raise error if filename is not a string
-- @function readlines
local function readlines(filename)
    assert_string(1,filename)
    local f,err = io.open(filename,'r')
    if not f then return raise(err) end
    local res = {}
    for line in f:lines() do
        append(res,line)
    end
    f:close()
    return res
end
return readlines
