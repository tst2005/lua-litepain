local mm = require "lp.micromodule"
assert(mm.ondemand == require "lp.micromodule.ondemand")
assert(mm.requireall == require "lp.micromodule.requireall")
assert(mm.prefixrequire == require "lp.micromodule.prefixrequire")
print("ok")
