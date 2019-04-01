--- litepain micromodule
--
-- @module lp.micromodule

local micromodules = {}

--- The On-demand wrapper
-- @field ondemand
-- @see lp.micromodule.ondemand
-- @class function
-- @name ondemand
micromodules.ondemand = true

--- The Require-All wrapper
-- @field requireall
-- @see lp.micromodule.requireall
-- @class function
-- @name requireall
micromodules.requireall = true

-- the wrapper to use
local wrapper = require "lp.micromodule.ondemand"
-- we can also use lp.micromodule.requireall
--local wrapper = require "lp.micromodule.requireall"

-- the `lp.micromodule` module
local M = wrapper("lp.micromodule.", micromodules, nil)
return M
