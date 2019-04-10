---
-- Dependencies: `lfs`
-- @module lp.path.require.lfs

-- Use: pcall,require,error

local res,lfs = pcall(require,'lfs')
if not res then
	error("lp.path requires LuaFileSystem")
end
return lfs
