project = 'litepain'
description = 'litepain Lua Libraries 1.6.0'
full_description = 'The documentation is available @{01-introduction.md|here}.'
title = 'litepain Documentation'
dir = 'lp-docs'
style = '!fixed'
use_markdown_titles = true
topics = 'lp-docs_topics'
examples = {'./examples','./tests/test-data.lua'}
package = 'lp'
format = 'discount'
sort_modules=true
file = './lua/lp'
kind_names={topic='Manual',module='Libraries'}
tparam_alias('array','array')
tparam_alias('array2d','array')
alias('ret',{'return',modifiers={type="$1"}})
