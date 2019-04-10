--- micro-module of `lp.detect`
-- @submodule lp.detect
-- @set no_summary=true

--- Content
-- @section content

--- the directory separator character for the current platform.
-- @field dir_separator
-- @class field
-- @name dir_separator
local dir_separator = _G.package.config:sub(1,1)
return dir_separator
