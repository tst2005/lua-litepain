--- Generally useful routines.
-- See  @{01-introduction.md.Generally_useful_functions|the Guide}.
--
-- Dependencies: `lp.compat`, all exported fields and functions from
-- `lp.compat` are also available in this module.
--
-- @module lp.utils.t.import
local fprintf = require "lp.utils.fprintf"
local rawget,rawset = rawget,rawset

local utils = {}

do
    local function import_symbol(T,k,v,libname)
        local key = rawget(T,k)
        -- warn about collisions!
        if key and k ~= '_M' and k ~= '_NAME' and k ~= '_PACKAGE' and k ~= '_VERSION' then
            fprintf(io.stderr,"warning: '%s.%s' will not override existing symbol\n",libname,k)
            return
        end
        rawset(T,k,v)
    end

    local function lookup_lib(T,t)
        for k,v in pairs(T) do
            if v == t then return k end
        end
        return '?'
    end

    local already_imported = {}

    --- take a table and 'inject' it into the local namespace.
    -- @param t The table (table), or module name (string), defaults to this `utils` module table
    -- @param T An optional destination table (defaults to callers environment)
    function utils.import(t,T)
        T = T or _G
        t = t or utils
        if type(t) == 'string' then
            t = require (t)
        end
        local libname = lookup_lib(T,t)
        if already_imported[t] then return end
        already_imported[t] = libname
        for k,v in pairs(t) do
            import_symbol(T,k,v,libname)
        end
    end
end
return utils.import
