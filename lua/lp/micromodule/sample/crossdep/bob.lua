local ondemand = require "lp.micromodule".ondemand
local M = ondemand("lp.micromodule.sample.crossdep.", {alice=true}, nil)
M.name="Bob"
M.likes=function() return M.name .." likes "..M.alice.name end
return M
