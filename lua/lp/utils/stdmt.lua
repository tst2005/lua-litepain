--- Generally useful routines.
-- See  @{01-introduction.md.Generally_useful_functions|the Guide}.
--
-- Dependencies: `lp.compat`, all exported fields and functions from
-- `lp.compat` are also available in this module.
--
-- @module lp.utils.stdmt

--- Standard meta-tables as used by other Penlight modules
-- @table stdmt
-- @field List the List metatable
-- @field Map the Map metatable
-- @field Set the Set metatable
-- @field MultiMap the MultiMap metatable
local stdmt = {
    List = {_name='List'},
    Map = {_name='Map'},
    Set = {_name='Set'},
    MultiMap = {_name='MultiMap'},
}
return stdmt
