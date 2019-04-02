local ondemand = require "lp.micromodule.ondemand"

local called = 0
local function call()
	called = called + 1
	return {}
end
local content = {foo = call}
local wrapped = ondemand(content)
assert(called==0)
assert( wrapped.foo )
-- now foo is in wrapped for direct access
assert(called==1)
assert( wrapped.foo ) -- should not call the `call()` function
assert(called==1) -- still 1
print("ok")
