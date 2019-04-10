---
-- Dependencies: `lfs`
-- @submodule lp.path

---- Get the working directory.
-- @field currentdir
return assert(require"lfs".currentdir)
