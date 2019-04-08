package = "litepain"
version = "scm-2"

source = {
  url = "git://github.com/tst2005/lua-litepain.git",
}

description = {
  summary = "Lua utility libraries loosely based on the Python standard libraries",
  homepage = "http://stevedonovan.github.com/lua-litepain",
  license = "MIT/X11",
  maintainer = "tst2005@gmail.com",
  detailed = [[
Litepain is (a fork of Penlight that is) a set of pure Lua libraries for making it easier to work with common tasks like
iterating over directories, reading configuration files and the like. Provides functional operations
on tables and sequences.
]]
}

dependencies = {
  "luafilesystem"
}

build = {
  type = "builtin",
  modules = {
--    ["lp"] = "lua/lp/init.lua",
    ["lp.compat"] = "lua/lp/compat.lua",
    ["lp.utils"] = "lua/lp/utils.lua",

--[==[
    ["lp.strict"] = "lua/lp/strict.lua",
    ["lp.dir"] = "lua/lp/dir.lua",
    ["lp.operator"] = "lua/lp/operator.lua",
    ["lp.input"] = "lua/lp/input.lua",
    ["lp.config"] = "lua/lp/config.lua",
    ["lp.seq"] = "lua/lp/seq.lua",
    ["lp.stringio"] = "lua/lp/stringio.lua",
    ["lp.text"] = "lua/lp/text.lua",
    ["lp.test"] = "lua/lp/test.lua",
    ["lp.tablex"] = "lua/lp/tablex.lua",
    ["lp.app"] = "lua/lp/app.lua",
    ["lp.stringx"] = "lua/lp/stringx.lua",
    ["lp.lexer"] = "lua/lp/lexer.lua",
    ["lp.sip"] = "lua/lp/sip.lua",
    ["lp.permute"] = "lua/lp/permute.lua",
    ["lp.pretty"] = "lua/lp/pretty.lua",
    ["lp.class"] = "lua/lp/class.lua",
    ["lp.List"] = "lua/lp/List.lua",
    ["lp.data"] = "lua/lp/data.lua",
    ["lp.Date"] = "lua/lp/Date.lua",
    ["lp.luabalanced"] = "lua/lp/luabalanced.lua",
    ["lp.comprehension"] = "lua/lp/comprehension.lua",
    ["lp.path"] = "lua/lp/path.lua",
    ["lp.array2d"] = "lua/lp/array2d.lua",
    ["lp.func"] = "lua/lp/func.lua",
    ["lp.lapp"] = "lua/lp/lapp.lua",
    ["lp.file"] = "lua/lp/file.lua",
    ['lp.temlpate'] = "lua/lp/temlpate.lua",
    ["lp.Map"] = "lua/lp/Map.lua",
    ["lp.MultiMap"] = "lua/lp/MultiMap.lua",
    ["lp.OrderedMap"] = "lua/lp/OrderedMap.lua",
    ["lp.Set"] = "lua/lp/Set.lua",
    ["lp.xml"] = "lua/lp/xml.lua",
    ["lp.url"] = "lua/lp/url.lua",
    ["lp.types"] = "lua/lp/types.lua",
    ["lp.import_into"] = "lua/lp/import_into.lua",
]==]--
  },
  copy_directories = {"docs", "tests"}
}
