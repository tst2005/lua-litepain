---
-- Dependencies: `lfs`
-- @submodule lp.path

---- Get the working directory.
-- @name currentdir
return assert(require"lfs".currentdir)
