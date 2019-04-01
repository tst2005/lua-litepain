local ondemand = require "lp.micromodule".ondemand
local M = ondemand("lp.micromodule.sample.crossdep.", {bob=true}, nil)
M.name="Alice"
M.likes=function() return M.name.." likes "..M.bob.name end
return M
