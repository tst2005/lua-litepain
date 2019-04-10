----------------
--- Lua 5.1/5.2/5.3 compatibility.
-- @submodule lp.compat
local compat = {}

    -- setfenv/getfenv replacements for Lua 5.2
    -- by Sergey Rozhenko
    -- http://lua-users.org/lists/lua-l/2010-06/msg00313.html
    -- Roberto Ierusalimschy notes that it is possible for getfenv to return nil
    -- in the case of a function with no globals:
    -- http://lua-users.org/lists/lua-l/2010-06/msg00315.html

---------------
-- Get environment of a function (in a Lua 5.1 compatible way).
-- Not 100% compatible, so with Lua 5.2 it may return nil for a function with no
-- global references!
-- Based on code by [Sergey Rozhenko](http://lua-users.org/lists/lua-l/2010-06/msg00313.html)
-- @param f a function or a call stack reference
-- @function compat.getfenv

if not compat.lua51 then -- define Lua 5.2 style load()
    local function getfenv(f)
        local f = f or 0
        f = (type(f) == 'function' and f or debug.getinfo(f + 1, 'f').func)
        local name, val
        local up = 0
        repeat
            up = up + 1
            name, val = debug.getupvalue(f, up)
        until name == '_ENV' or name == nil
        return val
    end
    return getfenv
end

return getfenv
