---
-- Dependencies: `lfs`
-- @submodule lp.path

--- Lua iterator over the entries of a given directory.
-- Behaves like `lfs.dir`
-- @name dir
return assert(require"lfs".dir)
