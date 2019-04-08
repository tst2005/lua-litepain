---
-- @submodule lp.utils

local error = error
local tostring = tostring
local io = io -- for io.stderr
local os = os -- for os.exit
local type = type
local fprintf = require "lp.utils.fprintf"
local utils = {}
local err_mode = 'default'

--- error out of this program gracefully.
-- @param[opt] code The exit code, defaults to -`1` if omitted
-- @param msg The exit message will be sent to `stderr` (will be formatted with the extra parameters)
-- @param ... extra arguments for message's format'
-- @see utils.fprintf
-- @usage utils.quit(-1, "Error '%s' happened", "42")
-- -- is equivalent to
-- utils.quit("Error '%s' happened", "42")  --> Error '42' happened
-- @function quit
local function quit(code, msg, ...)
    if type(code) == 'string' then
        fprintf(io.stderr, code, msg, ...)
        io.stderr:write('\n')
        code = -1 -- TODO: this is odd, see the test. Which returns 255 as exit code
    elseif msg then
        fprintf(io.stderr, msg, ...)
        io.stderr:write('\n')
    end
    os.exit(code, true)
end
utils.quit = quit

--- used by Penlight functions to return errors. Its global behaviour is controlled
-- by `utils.on_error`.
-- To use this function you MUST use it in conjunction with `return`, since it might
-- return `nil + error`.
-- @param err the error string.
-- @see utils.on_error
-- @usage
-- if some_condition then
--   return utils.raise("some condition was not met")  -- MUST use 'return'!
-- end
-- @function raise
local function raise (err)
    if err_mode == 'default' then
        return nil, err
    elseif err_mode == 'quit' then
        return quit(err)
    else
        error(err, 2)
    end
end
utils.raise = raise

--[[
local raises = {
	nilreturn = function (err) return nil, err end,
	quit = function(err) return quit(err) end,
	error = function(err) error(err, 2) end,
}
raises.default = raises.nilreturn
local function raise (err)
    return raises[err_mode](err)
end
]]--

--- control the error strategy used by Penlight.
-- This is a global setting that controls how `utils.raise` behaves:
--
-- - 'default': return `nil + error` (this is the default)
-- - 'error': throw a Lua error
-- - 'quit': exit the program
--
-- @param mode either 'default', 'quit'  or 'error'
-- @see utils.raise
-- @function on_error
function utils.on_error (mode)
    mode = tostring(mode)
    if ({['default'] = 1, ['quit'] = 2, ['error'] = 3})[mode] then
      err_mode = mode
    else
      -- fail loudly
      local err = "Bad argument expected string; 'default', 'quit', or 'error'. Got '"..tostring(mode).."'"
      if err_mode == 'default' then
        error(err, 2)  -- even in 'default' mode fail loud in this case
      end
      raise(err)
    end
end

return utils
-- TODO:
-- - split the 3 behavior in 3 separated modules (default, quit, error)
-- - be able to switch between behavior with on_error
-- - consider to rename 'default' to 'nil-return'
