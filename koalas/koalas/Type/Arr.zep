/**
 * Class for managing native arrays as instances
 * Just a playground for me on Zephir
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.1
 * @since 2025-08-20
 */
namespace Koalas\Type;
use Koalas\Type;


class Arr implements \Countable, \ArrayAccess
{
    const ERR_404 = "File not found -> %s";

    protected dta = [];

    public function __construct(dta = [])
    {
        let this->dta = dta;
    }

    public function slice (int offset, int length = null, bool preserve_keys = false) -> array
    {
        return array_slice(this->dta, offset, length, preserve_keys);
    }

    // alias for slice
    public function rows (int offset, int length = null, bool preserve_keys = false) -> array
    {
        return array_slice(this->dta, offset, length, preserve_keys);
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
             throw new \Exception(sprintf(self::ERR_404, file));
        } else {
            return new self(json_decode(file_get_contents(file), true));
        } 

    }

    public function count() -> int
    {
        return count(this->dta);
    }

    // Implementing \ArrayAccess 

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
}