let &l:equalprg="tidy -q -i --show-errors 0 -xml 2>/dev/null"
let &l:makeprg="tidy -quiet -xml -errors %"
let &l:errorformat="line %l column %v - %m"
