---
--
-- Dependencies: `lp.utils.split`, `lp.compat.unpack`
--
-- @submodule lp.utils

--local compat = require 'lp.compat'
--local _unpack = table.unpack  -- always injected by 'compat'
local _unpack require 'lp.compat.unpack'

local split = require "lp.utils.split"

--- split a string into a number of return values.
-- @param s the string
-- @param re the delimiter, default space
-- @return n values
-- @usage first,next = splitv('jane:doe',':')
-- @see split
-- @function splitv
local function splitv (s,re)
    return _unpack(split(s,re))
end
return splitv
