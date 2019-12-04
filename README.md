# Deep Space Books
## Login, Install, Use
placeholder, tbc

## Coding Notes 
### var vs. let
In most cases, let is used instead of var for enabling function scope instead 
of block scope as a default. With ESM5 (and ESM6), let prevents the unexpected
and weird behavior of var. In some cases, also const is a possible option for
variables which won't be reassigned. So for less confusing and more block
scoping, my choice is the choice for let and const instead of var. I also 
want to disable the hoisting mechanism of var. Writing a function, it may 
have weird side effects, if I use a variable before assignment and it seems 
to work but not the way I'd like.   
There are a lof of discussions about var, let and const out there in the huge
internet world. I don't want to write an essay about my programming style 
choices but I want to take a note about this. For further information, here
are some websites:
* https://medium.com/javascript-scene/javascript-es6-var-let-or-const-ba58b8dcde75
* https://softwareengineering.stackexchange.com/questions/274342/is-there-any-reason-to-use-the-var-keyword-in-es6
* https://babeljs.io/docs/en/learn#let-const