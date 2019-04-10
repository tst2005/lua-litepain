----------------
--- Lua 5.1/5.2/5.3 compatibility.
-- @submodule lp.compat

    -- setfenv/getfenv replacements for Lua 5.2
    -- by Sergey Rozhenko
    -- http://lua-users.org/lists/lua-l/2010-06/msg00313.html
    -- Roberto Ierusalimschy notes that it is possible for getfenv to return nil
    -- in the case of a function with no globals:
    -- http://lua-users.org/lists/lua-l/2010-06/msg00315.html

---------------
-- Set environment of a function (in a Lua 5.1 compatible way).
-- @param f a function or a call stack reference
-- @param env a table that becomes the new environment of `f`
-- @function setfenv

if not compat.lua51 then -- define Lua 5.2 style load()
    local function setfenv(f, t)
        f = (type(f) == 'function' and f or debug.getinfo(f + 1, 'f').func)
        local name
        local up = 0
        repeat
            up = up + 1
            name = debug.getupvalue(f, up)
        until name == '_ENV' or name == nil
        if name then
            debug.upvaluejoin(f, up, function() return name end, 1) -- use unique upvalue
            debug.setupvalue(f, up, t)
        end
        if f ~= 0 then return f end
    end
    return setfenv
end

return setfenv
