/**
 * Entity class handling data & operations for lists - e.G:
 * 
 * - (1, 2, 3)
 * - ['Foo', 23, 'bar']
 * 
 * Using \SplDoublyLinkedList internally
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.3
 * @since 2025-08-26
 */
namespace Koalas\Core\Kql\Entity;


class Lst implements \Iterator, \Countable, \ArrayAccess
{    
    protected dta = null;
    protected pos = null;
    
    protected autoTrim = true {
        get, set
    };

     // Stack operations

    public function push(mixed val) -> void
    {
        this->dta->push(val);
    }

    public function pop() -> mixed
    {
        return this->dta->pop();
    }

    public function unshift(mixed val) -> void
    {
        this->dta->unshift(val);
        
    }

    public function shift() -> mixed
    {
        return this->dta->shift();
    }

    /**
     * Insert value at index , shuffling the previous value at that index (and all subsequent values) up through the list. 
     * @see https://www.php.net/manual/en/spldoublylinkedlist.add.php
     */
    public function insert(int idx, mixed val) -> <Lst>
    {
        this->dta->add(idx, val);
        return this;
    }

    public function rewind() -> void 
    {
        let this->pos = 0;
    }

    public function current() -> mixed
    {
        return this->dta[this->pos];
    }

    public function key() -> mixed
    {
        return this->pos;
    }

    public function next() -> void
    {
        let this->pos++;
    }

    public function valid() -> bool 
    {
        return isset(this->dta[this->pos]);
    }

    public function __construct(array dta = [])
    {
        var itm;
        let this->dta = new \SplDoublyLinkedList();
        let this->pos = 0;
        for itm in dta {
            let itm = (this->autoTrim) 
                            ? trim(itm)
                            : itm;
            this->push(itm);
        }
    }

    public function getDta() -> <SplDoublyLinkedList>
    {
        return this->dta;
    }

    public function count() -> int
    {
        return count(this->dta);
    }

     public function offsetSet(offset, value) -> void 
    {
        if (is_null(offset)) {
            let this->dta[] = value;
        } else {
            let this->dta[offset] = value;
        }
    }

    public function offsetExists(offset) -> bool 
    {
        return isset(this->dta[offset]);
    }

    public function offsetUnset(offset) -> void 
    {
        unset(this->dta[offset]);
    }

    public function offsetGet(offset) -> mixed 
    {
        return isset(this->dta[offset]) ? this->dta[offset]  : null;
    }

    
}