----------------
--- Lua 5.1/5.2/5.3 compatibility.
-- Injects `table.pack`, `table.unpack` (in the global environment)?,
-- to make sure they are available for Lua 5.1 and LuaJIT.
--
-- @submodule lp.compat

--! --- Global exported functions (for Lua 5.1 & LuaJIT)
--! -- @section lua52

--- unpack a table and return the elements.
--
-- NOTE: this version does NOT honor the n field, and hence it is not nil-safe.
-- See `utils.unpack` for a version that is nil-safe.
-- @param t table to unpack
-- @param[opt] i index from which to start unpacking, defaults to 1
-- @param[opt] t index of the last element to unpack, defaults to #t
-- @return multiple return values from the table
--! -- @function table.unpack
-- @see utils.unpack
-- @function unpack
compat.unpack = table.unpack or _G.unpack

return compat.unpack
