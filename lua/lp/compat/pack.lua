----------------
--- Lua 5.1/5.2/5.3 compatibility.
-- Injects `table.pack`, `table.unpack` (in the global environment)?,
-- to make sure they are available for Lua 5.1 and LuaJIT.
--
-- @submodule lp.compat

--! --- Global exported functions (for Lua 5.1 & LuaJIT)
--! -- @section lua52

--- pack an argument list into a table.
-- @param ... any arguments
-- @return a table with field n set to the length
--! -- @function table.pack
-- @function pack
compat.pack = table.pack or 
	function table.pack (...)       -- luacheck: ignore
		return {n=select('#',...); ...}
	end

return compat.pack
