---
-- Dependencies: none
--
-- @submodule lp.utils

--- pack an argument list into a table.
-- @param ... any arguments
-- @return a table with field `n` set to the length
-- @function pack
-- @see compat.pack
local pack = table.pack  -- added here to be symmetrical with unpack
return pack
