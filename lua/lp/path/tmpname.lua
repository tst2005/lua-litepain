---
-- Dependencies: `lp.utils`, `lfs`
-- @submodule lp.path

local is_windows = require "lp.path.is_windows"

-- imports and locals
local os_tmpname = os.tmpname
local getenv = os.getenv

--- Return a suitable full path to a new temporary file name.
-- unlike os.tmpname(), it always gives you a writeable path (uses TEMP environment variable on Windows)
local function tmpname ()
    local res = os_tmpname()
    -- On Windows if Lua is compiled using MSVC14 os.tmpname
    -- already returns an absolute path within TEMP env variable directory,
    -- no need to prepend it.
    if is_windows and not res:find(':') then
        res = getenv('TEMP')..res
    end
    return res
end
return tmpname
