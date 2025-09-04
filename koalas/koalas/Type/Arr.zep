/**
 * Class for managing native arrays as instances
 * 
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
 * @since 2025-08-20
 */
namespace Koalas\Type;
use Koalas\Type;


class Arr implements \Countable, \ArrayAccess, \Iterator
{
    const ERR_404 = "File not found -> %s";

    protected dta = [];

    protected pos = 0;

    public function __construct(dta = [])
    {
        let this->dta = dta;
    }

    public function slice (int offs, int len = null, int stp = 1, bool prsKeys = false) -> array
    {
        var tmp = [];
        if stp == 1 {
            let tmp = array_slice(this->dta, offs, len, prsKeys);
        } else {
            int i = 0;
            int last = offs+len;
            for i in range(offs, last) {
                let tmp[] = this->dta[i];
            }
        }
        return tmp;
    }

    // alias for slice
    public function rows (int offs, int len = null, bool prsKeys = false) -> array
    {
        return this->slice(offs, len, prsKeys);
    }

    public function cols(string col) -> array
    {
        return array_column(this->dta, col);
    }

    public function walk(clj) -> <Arr>
    {
        array_walk(this->dta, clj);
        return this;
    }

    public function map(clj) -> array
    {
        return array_map(clj, this->dta);
    }

    public function join(string mark="'") -> string
    {
        return implode(mark, this->dta);
    }


    public function raw() -> array
    {
        return this->dta;
    }

    public static function fromJson(string file) -> <Arr>
    {
        if (!file_exists(file)) {
             throw new \Exception(sprintf(Arr::ERR_404, file));
        } else {
            return new self(json_decode(file_get_contents(file), true));
        } 

    }

    public function count() -> int
    {
        return count(this->dta);
    }

    // Implementing \ArrayAccess 

    public function offsetSet(offs, value) -> void 
    {
        if (is_null(offs)) {
            let this->dta[] = value;
        } else {
            let this->dta[offs] = value;
        }
    }

    public function offsetExists(offs) -> bool 
    {
        return isset(this->dta[offs]);
    }

    public function offsetUnset(offs) -> void 
    {
        unset(this->dta[offs]);
    }

    public function offsetGet(offs) -> mixed 
    {
        return isset(this->dta[offs]) ? this->dta[offs]  : null;
    }

    // Stack operations

    public function push(mixed value) -> <Arr>
    {
        array_push(this->dta, value);
        return this;
    }

    public function pop() -> mixed
    {
        return array_pop(this->dta);
    }

    public function unshift(mixed value) -> <Arr>
    {
        array_unshift(this->dta, value);
        return this;
    }

    public function shift() -> mixed
    {
        return array_shift(this->dta);
        
    }

    /**
     * Gets the first key|index of an array
     *
     * @return string|integer|null
     */
    public function firstKey() -> string|int|null
    {
        return array_key_first($this->dta);
    }

    /**
     * Gets the last key|index of an array
     *
     * @return string|integer|null
     */
    public function lastKey() -> string|int|null
    {
        return array_key_last($this->dta);
    }

    // Implementing \Iterator

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
        let this->pos ++;
    }

    public function valid() -> bool 
    {
        return isset(this->dta[this->pos]);
    }
}