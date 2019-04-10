----------------
--- A lua 5.3 `package.searchpath` function for any Lua version.
--
-- @module lp.compat.searchpath

local searchpath = package.searchpath
local io = io -- for io.open

--- return the full path where a Lua module name would be matched.
-- @param mod module name, possibly dotted
-- @param path a path in the same form as package.path or package.cpath
-- @see path.package_path
-- @class function
-- @name searchpath
local searchpath = package.searchpath
if not searchpath then
    local sep = package.config:sub(1,1)
    function searchpath (mod,path)    -- luacheck: ignore
        mod = mod:gsub('%.',sep)
        for m in path:gmatch('[^;]+') do
            local nm = m:gsub('?',mod)
            local f = io.open(nm,'r')
            if f then f:close(); return nm end
        end
    end
end
-- @function package.searchpath
-- FIXME: the searchpath argument are not conform to lua5.3 ! current: (mod,path); expected: (name, path [, sep [, rep]])

return searchpath
