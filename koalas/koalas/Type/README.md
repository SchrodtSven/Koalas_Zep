# Koalas\Type

PHP's native types as Objects     

# API

### Str

```zephir
    public function __construct(cnt = "") {} // Constructor
    public function q(mark=self::QS) {} // Quoting string
    public function app(string txt) {} // Appending string
    public function prep(string txt) } // Prepending string
    public function splitByWS() -> array {} // split string on whitespace
    public function splitBy(string separator) -> array {} // Splitting by separator
    public function replace(find, replace = '') {} // replacing 
    public function stringsBetween(string start, string end) {} //
    public function __toString() -> string {} // Magic interceptor for string context
```