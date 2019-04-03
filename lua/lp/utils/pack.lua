--- Generally useful routines.
-- See  @{01-introduction.md.Generally_useful_functions|the Guide}.
--
-- Dependencies: `lp.compat`, all exported fields and functions from
-- `lp.compat` are also available in this module.
--
-- @module lp.utils.pack

--- pack an argument list into a table.
-- @param ... any arguments
-- @return a table with field `n` set to the length
-- @function pack
-- @see compat.pack
local pack = table.pack  -- added here to be symmetrical with unpack
return pack
