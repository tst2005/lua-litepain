local mm = require "lp.micromodule"
assert(mm.ondemand == require "lp.micromodule.ondemand")
assert(mm.requireall == require "lp.micromodule.requireall")
print("ok")
