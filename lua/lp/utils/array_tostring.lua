--- Generally useful routines.
-- See  @{01-introduction.md.Generally_useful_functions|the Guide}.
--
-- Dependencies: `lp.compat`, all exported fields and functions from
-- `lp.compat` are also available in this module.
--
-- @submodule lp.utils

--- File handling
-- @section files

--- convert an array of values to strings.
-- @param t a list-like table
-- @param[opt] temp (table) buffer to use, otherwise allocate
-- @param[opt] tostr custom tostring function, called with (value,index). Defaults to `tostring`.
-- @return the converted buffer
-- @function array_tostring
local function array_tostring (t,temp,tostr)
    temp, tostr = temp or {}, tostr or tostring
    for i = 1,#t do
        temp[i] = tostr(t[i],i)
    end
    return temp
end
return array_tostring
