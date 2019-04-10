----------------
--- Lua 5.1/5.2/5.3 compatibility.
--
-- @submodule lp.compat

local lua51 = require "lp.detect.lua51"
local jit = require "lp.detect.jit"

----------------
-- Load Lua code as a text or binary chunk (in a Lua 5.2 compatible way).
-- @param ld code string or loader
-- @param[opt] source name of chunk for errors
-- @param[opt] mode 'b', 't' or 'bt'
-- @param[opt] env environment to load the chunk in
-- @function load
local compat_load
if lua51 then -- define Lua 5.2 style load()
    if not jit then -- but LuaJIT's load _is_ compatible
        local lua51_load = load
        function compat_load(str,src,mode,env)
            local chunk,err
            if type(str) == 'string' then
                if str:byte(1) == 27 and not (mode or 'bt'):find 'b' then
                    return nil,"attempt to load a binary chunk"
                end
                chunk,err = loadstring(str,src)
            else
                chunk,err = lua51_load(str,src)
            end
            if chunk and env then setfenv(chunk,env) end
            return chunk,err
        end
    else
        compat_load = load
    end
else
    compat_load = load
end
return compat_load
