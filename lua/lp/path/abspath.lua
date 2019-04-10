---
-- Dependencies: `pl.utils`, `lfs`, FIXME
-- @submodule lp.path

-- imports and locals
local assert_string = require "lp.utils.assert_string"

local normpath = require "lp.path.normpath"
local is_windows = require "lp.path.is_windows"

local currentdir = require "lp.path.require.lfs".currentdir

local isabs = require "lp.path.isabs"
local join = require "lp.path.join"

local sub = string.sub
local function at(s,k) return s:sub(k,k) end

--- return an absolute path.
-- @string P A file path
-- @string[opt] pwd optional start path to use (default is current dir)
-- @function abspath
return function(P,pwd)
    assert_string(1,P)
    if pwd then assert_string(2,pwd) end
    local use_pwd = pwd ~= nil
    if not use_pwd and not currentdir then return P end
    P = P:gsub('[\\/]$','')
    pwd = pwd or currentdir()
    if not isabs(P) then
        P = join(pwd,P)
    elseif is_windows and not use_pwd and at(P,2) ~= ':' and at(P,2) ~= '\\' then
        P = pwd:sub(1,2)..P -- attach current drive to path like '\\fred.txt'
    end
    return normpath(P)
end
