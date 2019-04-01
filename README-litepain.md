# litepain

`litepain` is a fork of Penlight (launched at Penlight v1.6.0).

# Differences

* Major code refactoring to have micro-modules
* Avoid as possible to change the global environment
* Fine-grained (micro)modules dependencies

## First goal

* the first target is `pl.path`
* It need to refactor the most used modules (`pl.compat`, `pl.utils`, etc)

