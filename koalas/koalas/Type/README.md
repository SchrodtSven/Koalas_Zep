# Koalas\Type

PHP's native types as Objects     

> [!IMPORTANT]  
> Note to myself: add parameter and return type hints!

# API
find . -type f -name "*.zep"  -exec wc -l
### Str

```zephir
    public function __construct(cnt = "") {} // Constructor
    public function q(mark=self::QS) {} // Quoting string
    public function app(string txt) {} // Appending string
    public function prep(string txt) {} // Prepending string
    public function splitByWS() -> array {} // split string on whitespace
    public function splitBy(string sep) -> array {} // Splitting by separator
    public function replace(fnd, rpl = '') {} // replacing 
    public function stringsBetween(string start, string end) {} // getting substring between two other strings
    public function __toString() -> string {} // Magic interceptor for string context
    public function begins(string txt) -> bool {} //
    public function ends(string txt) -> bool {} //
    public function contains(string txt) -> bool {} //
    public function substr(int start, int length=null, string encoding = null) {} //
    public function substrCount(string needle, string encoding = null) -> int {} //
    public function __toString() {} //
    public function splitOnUpperCaseSubstring() -> array {} //
    public function camelize(string sep = "_", bool lf = true) {} //
    public function snakify(bool lc= true, string glue ="_") {} //
    public function upperFirst() {} //
    public function lowerFirst() {} //
    public function upper() {} //
    public function lower() {} //
```

### Arr

```zephir
    public function __construct(dta = []) {} // Constructor
    public function slice (int offset, int length = null, bool preserve_keys = false) -> array {} //
    public function rows (int offset, int length = null, bool preserve_keys = false) -> array {} //
    public function cols(string col) -> array {} // strip "column" from array
    public function walk(clj) -> <Arr> {} // walking over original data
    public function map(clj) -> array {} // returning new data
    public function raw() -> array {} // returning internal data as PHP array
    public static function fromJson(string file) -> <Arr> {} // creating instance from parsed JSON data
    public function count() -> int {} // returning length of array
```

### Example usage <kbd>Arr::walk()</kbd>

Operating on origin <kbd>Arr</kbd>

```php
 
 function quoteListByWalk(Arr $tokens): Arr 
 {
    $tokens->walk(function(&$itm) {
        $itm =  "'{$itm}'";
    });
    return $myArr->raw();
 }   
```

### Example usage <kbd>Arr::map()</kbd>

Creating new <kbd>Arr</kbd> by mapping original data
```php

 function quoteListByMap(Arr $tokens): array 
 {
    return $tokens->map(function($itm) {
        return "'{$itm}'";
    });
    
 }  
```
