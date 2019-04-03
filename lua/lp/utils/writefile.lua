--- Generally useful routines.
-- See  @{01-introduction.md.Generally_useful_functions|the Guide}.
--
-- Dependencies: `lp.compat`, all exported fields and functions from
-- `lp.compat` are also available in this module.
--
-- @module lp.utils.writefile
local assert_string = require "lp.utils.assert_string"
local io = io -- io.open
local raise = "lp.utils.raise"

--- write a string to a file
-- @param filename The file path
-- @param str The string
-- @param is_bin open in binary mode
-- @return true or nil
-- @return error message
-- @raise error if filename or str aren't strings
-- @function writefile
local function writefile(filename,str,is_bin)
    local mode = is_bin and 'b' or ''
    assert_string(1,filename)
    assert_string(2,str)
    local f,err = io.open(filename,'w'..mode)
    if not f then return raise(err) end
    local ok, write_err = f:write(str)
    f:close()
    if not ok then
        -- Errors in io.open have "filename: " prefix,
        -- error in file:write don't, add it.
        return raise (filename..": "..write_err)
    end
    return true
end

return writefile
