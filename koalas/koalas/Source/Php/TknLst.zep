/**
 * Class representing list of PHP Tokens <SplDSplDoublyLinkedList>[\PhpToken]
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.3
 * @since 2025-08-28
 */
namespace Koalas\Source\Php;
use SplDoublyLinkedList;
use Koalas\Source\Generic\Stringify;

use PhpToken;

class TknLst extends SplDoublyLinkedList
{
    public function __construct(array dta = [])
    {   
        var itm;
        for itm in dta {
            this->append(itm);
        }
    }
    
    /**
     * Wrapper for self::push() with type hint
     *
     * @param \PhpToken token
     * @return void
     */
    public function append(<PhpToken> token) -> <TknList>
    {
        this->push(token);
        return this;
    }

    /**
     * Wrapper for self::add() with type hint
     *
     * @param \PhpToken token
     * @return void
     */

    public function prepend(int idx, <PhpToken> token) -> <TknList>
    {
        this->add(idx, token);
        return this;
    }


    /**
     * Wrapper for self::offsetUnset() as fluent interface
     *
     * @param \PhpToken token
     * @return void
     */

    public function del(int idx) -> <TknList>
    {
        this->offsetUnset(idx);
        return this;
    }
        
    public function __toString() -> string
    {
        var tmp, idx, val, ln, cls;
        let tmp = "";
        let idx = 0;
        this->rewind();
        while(this->valid()) {
            let val = this->current();
            let ln = implode(" : ", get_object_vars(val));
            let cls = get_class(val);
            //if (val->id != \T_WHITESPACE)
            let tmp = tmp . "Idx: " . idx . " " . Stringify::fromTkn(val) . " type: \\" . cls . PHP_EOL;
            let idx ++;
            this->next();
        }
        return tmp;
    }

    /**
     * Goto index == idx
     */
    public function gto(int idx) -> void
    {
        this->chkIdx(idx);
        this->rewind();
        while(this->key()!=idx) {
            this->next();
        }
    }

    /**
     * Slicing between offs and last
     */
    public function slc(int offs, int last) -> <TknLst>
    {
        this->chkIdx(offs);
        this->chkIdx(last);
        var tmp;
        let tmp = new TknLst();
        this->gto(offs);
        tmp->push(this->current());
        while(this->key()!= last) {
            this->next();
            tmp->push(this->current());
        }
        return tmp;
    }

    /** 
     * checking, if idx is valid - is between 0 and count(this)-1
     */
    public function chkIdx(int idx) -> void
    {
        int mxm = count(this);
        let mxm --;
        if (idx > mxm || idx < 0) {
            throw new \InvalidArgumentException(
                sprintf("Index error! %s - valid boundaries: %d - %d", 
                        idx, 
                        0, 
                        mxm)
            );
        }
    }

    public function toArray() -> array
    {
        array tmp = [];
        this->rewind();
        while(this->valid()) {
            let tmp[] = this->current();
            this->next();
        }
        return tmp;
    }

    public function toCode() -> string
    {
        return implode("", this->toArray());
    }

}
