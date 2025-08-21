# DAD - Design& Architecture Dossier

## Conventions

1. We use short hand variable names (```dta, col, fn, clj, flr```) for (data, column, filename, closure, filter) etc., but 'speaking' class names 
2. ```Namespace``` will be <kbd>Koalas\\*</kbd>

<s>Classes wrapping funtionality for native PHP data types will be named like <code>StringClass</code> as in <code>stdClass</code>, but <i>ucfirst</i>-style</s>
<s>Global function names borrowed from the snake, but also existing in <kbd>PHP</kbd>, will be prefixed by <code>k</code> as in <code>kprint</code></s>

## Way to go, while developing 

During the main developing phase of this project, we will use magic interceptors (that may disappear l8er; or *not*).


## Indexing, Slicing

Ok, we can *not* access (<code>ArrayAccess</code> implementing types) the snaky way via12 
 - <code>$a[1:2]</code>
 - <code>$a[3:]</code>
 - <code>$a[:4]</code>

 directly, - so we are making a little tradeoff here, by slicing this way (accessors as `string`; resulting in short handed <kbd>*::slice($start,end,step)</kbd>):

 - <code>$a['1:2']</code>
 - <code>$a['3:']</code>
 - <code>$a[':4']</code>
 - <code>$a['::2']</code>
 