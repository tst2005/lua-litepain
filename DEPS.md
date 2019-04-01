
# module without dependency

* `pl.class`
* `pl.compat`
* `pl.lexer`

## level 0 details

* 0 pl.class:pl.Date
* 0 pl.class:pl.List
* 0 pl.class:pl.Map
* 0 pl.class:pl.MultiMap
* 0 pl.class:pl.OrderedMap
* 0 pl.class:pl.Set

* 0 pl.compat:pl.utils

* 0 pl.lexer:pl.pretty

# module with dependencies (level 1)

* `pl.utils`

## level 1 details

* 1 pl.utils:pl.app
* 1 pl.utils:pl.array2d
* 1 pl.utils:pl.comprehension
* 1 pl.utils:pl.data
* 1 pl.utils:pl.Date
* 1 pl.utils:pl.dir
* 1 pl.utils:pl.file
* 1 pl.utils:pl.func
* 1 pl.utils:pl.input
* 1 pl.utils:pl.List
* 1 pl.utils:pl.Map
* 1 pl.utils:pl.MultiMap
* 1 pl.utils:pl.OrderedMap
* 1 pl.utils:pl.path
* 1 pl.utils:pl.permute
* 1 pl.utils:pl.pretty
* 1 pl.utils:pl.seq
* 1 pl.utils:pl.Set
* 1 pl.utils:pl.stringx
* 1 pl.utils:pl.tablex
* 1 pl.utils:pl.template
* 1 pl.utils:pl.test
* 1 pl.utils:pl.text
* 1 pl.utils:pl.types
* 1 pl.utils:pl.xml

# module with dependencies (level 2)

* `pl.types`
* `pl.path`
* `pl.array2d`
* `pl.operator`

## level 2 details

* 2 pl.types'.is_callable:pl.seq
* 2 pl.types'.is_callable:pl.text
* 2 pl.types:pl.array2d
* 2 pl.types:pl.tablex

* 2 pl.path:pl.app
* 2 pl.path:pl.dir
* 2 pl.path:pl.file
* 2 pl.path:pl.test

* 2 pl.array2d:pl.data

* 2 pl.operator'.optable:pl.utils

# module with dependencies (level 3 and more)

* `pl.tablex`
* `pl.dir`
## level 3 details

* 3 pl.tablex:pl.array2d
* 3 pl.tablex:pl.func
* 3 pl.tablex:pl.List
* 3 pl.tablex:pl.Map
* 3 pl.tablex:pl.OrderedMap
* 3 pl.tablex:pl.permute
* 3 pl.tablex:pl.Set
* 3 pl.tablex:pl.test

* 3 pl.dir:pl.file

# module with dependencies (level 4)

* `pl.List`
* `pl.pretty`

## level 4 details

* 4 pl.List:pl.MultiMap
* 4 pl.List:pl.OrderedMap

* 4 pl.pretty:pl.test
* 4 pl.pretty'.write:pl.Map

# module with dependencies (level 5)

* `pl.Map`
* `pl.stringx`

## level 5 details

* 5 pl.Map:pl.MultiMap
* 5 pl.Map:pl.OrderedMap
* 5 pl.Map:pl.Set

* 5 pl.stringx:pl.Date
* 5 pl.stringx'.quote_string:pl.pretty

