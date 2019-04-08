---
-- Dependencies: none.
--
-- @submodule lp.utils

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
