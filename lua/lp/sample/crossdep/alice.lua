--- The sample module named alice
--
-- Dependencies: `lp.sample.crossdep.alice`, `lp.micromodule.ondemand`
--
-- @module lp.sample.crossdep.alice

local ondemand = require "lp.micromodule".ondemand
local M = ondemand("lp.micromodule.sample.crossdep.", {bob=true}, nil)
--- Who is this module ?
-- @field name
M.name="Alice"
--- Who Alice likes ?
-- @function likes
M.likes=function() return M.name.." likes "..M.bob.name end
return M
