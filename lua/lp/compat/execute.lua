-- ----------------
-- --- micro-module of `lp.compat`
-- -- @module lp.compat.execute

local os = os -- for os.execute
local detect = require "lp.detect" -- for detect.is_windows, detect.lua51, detect.jit52

--! --- execute a shell command, in a compatible and platform independent way.
--! -- This is a compatibility function that returns the same for Lua 5.1 and
--! -- Lua 5.2+.
--! --
--! -- NOTE: Windows systems can use signed 32bit integer exitcodes. Posix systems
--! -- only use exitcodes 0-255, anything else is undefined.
--! -- @param cmd a shell command
--! -- @return true if successful
--! -- @return actual return code
--! -- @function execute
return function(cmd)
    local res1,res2,res3 = os.execute(cmd)
    if res2 == "No error" and res3 == 0 and compat.is_windows then
      -- os.execute bug in Lua 5.2+ not reporting -1 properly on Windows
      res3 = -1
    end
    if detect.lua51 and not detect.jit52 then
        if detect.is_windows then
            return res1==0,res1
        else
            res1 = res1 > 255 and res1 / 256 or res1
            return res1==0,res1
        end
    else
        if detect.is_windows then
            return res3==0,res3
        else
            return not not res1,res3
        end
    end
end
