--- The sample module named bob
--
-- Dependencies: `lp.sample.crossdep.alice`, `lp.micromodule.ondemand`
--
-- @module lp.sample.crossdep.bob

local ondemand = require "lp.micromodule".ondemand
local M = ondemand("lp.micromodule.sample.crossdep.", {alice=true}, nil)
--- Who is this module ?
-- @class field
-- @name name
M.name = "Bob"

--- Who bob likes ?
-- @function likes
M.likes=function() return M.name .." likes "..M.alice.name end
return M
