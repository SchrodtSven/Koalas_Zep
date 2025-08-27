# Koalas\Core\Entity

Entity classes for elements of <kbd>Kql</kbd>

## API 

### Lst

Data in List contexts

```zep
    public function push(mixed val) -> void {} //
    public function pop() -> mixed {} //
    public function unshift(mixed val) -> void {} //
    public function shift() -> mixed {} //
    public function insert(int idx, mixed val) -> <Lst> {} 
    public function rewind() -> void  {} //
    public function current() -> mixed {} //
    public function key() -> mixed {} //
    public function next() -> void {} //
    public function valid() -> bool  {} //
    public function __construct(array dta = []) {} //
    public function getDta() -> <SplDoublyLinkedList>
```


### Num

Data in (scalar) numeric context