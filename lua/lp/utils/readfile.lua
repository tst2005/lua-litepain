--- Generally useful routines.
-- See  @{01-introduction.md.Generally_useful_functions|the Guide}.
--
-- Dependencies: `lp.compat`, all exported fields and functions from
-- `lp.compat` are also available in this module.
--
-- @module lp.utils.readfile
local io = io -- for io.open
local raise = "lp.utils.raise"
local assert_string = require "lp.utils.assert_string"

--- File handling
-- @section files

--- return the contents of a file as a string
-- @param filename The file path
-- @param is_bin open in binary mode
-- @return file contents
-- @function readfile
local function readfile(filename,is_bin)
    local mode = is_bin and 'b' or ''
    assert_string(1,filename)
    local f,open_err = io.open(filename,'r'..mode)
    if not f then return raise (open_err) end
    local res,read_err = f:read('*a')
    f:close()
    if not res then
        -- Errors in io.open have "filename: " prefix,
        -- error in file:read don't, add it.
        return raise (filename..": "..read_err)
    end
    return res
end

return readfile

