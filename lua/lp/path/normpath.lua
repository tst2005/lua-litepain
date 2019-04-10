---
-- Dependencies: `pl.utils`, `lfs`
-- @submodule lp.path

-- imports and locals

local assert_string = -- FIXME
local is_windows = 
local at = 
local remove, append, concat = 

--- normalize a path name.
--  A//B, A/./B and A/foo/../B all become A/B.
-- @string P a file path
-- @function normpath
local function normpath(P)
    assert_string(1,P)
    -- Split path into anchor and relative path.
    local anchor = ''
    if path.is_windows then
        if P:match '^\\\\' then -- UNC
            anchor = '\\\\'
            P = P:sub(3)
        elseif at(P, 1) == '/' or at(P, 1) == '\\' then
            anchor = '\\'
            P = P:sub(2)
        elseif at(P, 2) == ':' then
            anchor = P:sub(1, 2)
            P = P:sub(3)
            if at(P, 1) == '/' or at(P, 1) == '\\' then
                anchor = anchor..'\\'
                P = P:sub(2)
            end
        end
        P = P:gsub('/','\\')
    else
        -- According to POSIX, in path start '//' and '/' are distinct,
        -- but '///+' is equivalent to '/'.
        if P:match '^//' and at(P, 3) ~= '/' then
            anchor = '//'
            P = P:sub(3)
        elseif at(P, 1) == '/' then
            anchor = '/'
            P = P:match '^/*(.*)$'
        end
    end
    local parts = {}
    for part in P:gmatch('[^'..sep..']+') do
        if part == '..' then
            if #parts ~= 0 and parts[#parts] ~= '..' then
                remove(parts)
            else
                append(parts, part)
            end
        elseif part ~= '.' then
            append(parts, part)
        end
    end
    P = anchor..concat(parts, sep)
    if P == '' then P = '.' end
    return P
end
return normpath
