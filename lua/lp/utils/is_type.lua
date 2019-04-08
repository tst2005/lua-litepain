---
-- Dependencies: none
--
-- @submodule lp.utils

--- is the object of the specified type?
-- If the type is a string, then use type, otherwise compare with metatable
-- @param obj An object to check
-- @param tp String of what type it should be
-- @return boolean
-- @usage utils.is_type("hello world", "string")   --> true
-- -- or check metatable
-- local my_mt = {}
-- local my_obj = setmetatable(my_obj, my_mt)
-- utils.is_type(my_obj, my_mt)  --> true
-- @function is_type
local function is_type (obj,tp)
    if type(tp) == 'string' then return type(obj) == tp end
    local mt = getmetatable(obj)
    return tp == mt
end
return is_type
