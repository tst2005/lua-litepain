--- Generally useful routines.
-- See  @{01-introduction.md.Generally_useful_functions|the Guide}.
--
-- Dependencies: `lp.compat`, all exported fields and functions from
-- `lp.compat` are also available in this module.
--
-- @module lp.utils.unpack
local _unpack = table.unpack  -- always injected by 'compat'

--- unpack a table and return its contents.
--
-- NOTE: this implementation differs from the Lua implementation in the way
-- that this one DOES honor the `n` field in the table `t`, such that it is 'nil-safe'.
-- @param t table to unpack
-- @param[opt] i index from which to start unpacking, defaults to 1
-- @param[opt] t index of the last element to unpack, defaults to `t.n` or `#t`
-- @return multiple return values from the table
-- @function unpack
-- @see compat.unpack
-- @usage
-- local t = table.pack(nil, nil, nil, 4)
-- local a, b, c, d = table.unpack(t)   -- this `unpack` is NOT nil-safe, so d == nil
--
-- local a, b, c, d = utils.unpack(t)   -- this is nil-safe, so d == 4
local function unpack(t, i, j)
    return _unpack(t, i or 1, j or t.n or #t)
end
return unpack
