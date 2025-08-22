# Koalas\Type

PHP's native types as Objects     

# API

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
    public function begins(string txt) -> bool
    public function ends(string txt) -> bool
    public function contains(string txt) -> bool
    public function substr(int start, int length=null, string encoding = null)
    public function substrCount(string needle, string encoding = null) -> int
    public function __toString()
    public function splitOnUpperCaseSubstring() -> array
    public function camelize(string sep = "_", bool lf = true)
    public function snakify(bool lc= true, string glue ="_")
    public function upperFirst()
    public function lowerFirst()
    public function upper()
    public function lower()
```

### Arr

```zephir
    public function __construct(dta = []) {} //
    public function slice (int offset, int length = null, bool preserve_keys = false) -> array {} //
    public function rows (int offset, int length = null, bool preserve_keys = false) -> array {} //
    public function cols(string col) -> array {} //
    public function walk(clj) -> <Arr> {} //
    public function map(clj) -> array {} //
    public function raw() -> array {} //
    public static function fromJson(string file) -> <Arr> {} //
```

