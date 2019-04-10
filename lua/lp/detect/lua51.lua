--- micro-module of `lp.detect`
-- @submodule lp.detect
-- @set no_summary=true

--- boolean flag this is Lua 5.1 (or LuaJIT).
-- @field lua51
-- @class field
-- @name lua51
local lua51 = _VERSION == 'Lua 5.1'
return function() return lua51 end
