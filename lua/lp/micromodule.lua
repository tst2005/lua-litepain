--- litepain micromodule
--
-- @module lp.micromodule

-- setup the content of this module
local content = {}

local prefixrequire = require "lp.micromodule.prefixrequire"
local subrequire = prefixrequire("lp.micromodule.", require)

--- The On-demand wrapper
-- @field ondemand
-- @see lp.micromodule.ondemand
-- @class function
-- @name ondemand
content.ondemand = subrequire
--content.ondemand = function() return require("lp.micromodule.ondemand") end

--- The Require-All wrapper
-- @field requireall
-- @see lp.micromodule.requireall
-- @class function
-- @name requireall
content.requireall = subrequire
--content.requireall = function() return require("lp.micromodule.requireall") end

--- The helper to make sub-require generic functions
-- @field prefixrequire
-- @see lp.micromodule.prefixrequire
-- @class function
-- @name prefixrequire
content.prefixrequire = subrequire

-- The wrapper to use (that is also it-self a component of this module)

-- 1) On demand
local wrapper = require "lp.micromodule.ondemand"

-- 2) Staticly
--local wrapper = require "lp.micromodule.requireall"

local M = wrapper(content)
assert(M.ondemand == require "lp.micromodule.ondemand")
return M
