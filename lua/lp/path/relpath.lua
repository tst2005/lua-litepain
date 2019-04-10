--- Path manipulation and file queries.
--
-- This is modelled after Python's os.path library (10.1); see @{04-paths.md|the Guide}.
--
-- Dependencies: `lp.utils`, `lfs`
-- @submodule lp.path

-- imports and locals

local append, concat = table.insert, table.concat
local min = math.min

local sub = string.sub
local at = function(a, b) return sub(a, b, b) end

local lfs = require "lfs"
local currentdir = lfs.currentdir
local assert_string = require "lp.utils.assert_string"
local split = require "lp.utils.split"
local normcase = require "lp.path.normcase"
local abspath = require "lp.path.abspath"

--- relative path from current directory or optional start point
-- @string P a path
-- @string[opt] start optional start point (default current directory)
-- @function relpath
local function relpath (P,start)
	assert_string(1,P)
	if start then assert_string(2,start) end

	P = normcase(path.abspath(P,start))
	start = start or currentdir()
	start = normcase(start)
	local startl, Pl = split(start,sep), split(P,sep)
	local n = min(#startl,#Pl)
	if path.is_windows and n > 0 and at(Pl[1],2) == ':' and Pl[1] ~= startl[1] then -- FIXME
		return P
	end
	local k = n+1 -- default value if this loop doesn't bail out!
	for i = 1,n do
		if startl[i] ~= Pl[i] then
			k = i
			break
		end
	end
	local rell = {}
	for i = 1, #startl-k+1 do rell[i] = '..' end
	if k <= #Pl then
		for i = k,#Pl do append(rell,Pl[i]) end
	end
	return concat(rell,sep)
end
return relpath
