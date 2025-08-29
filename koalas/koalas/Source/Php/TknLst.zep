/**
 * Class representing list of PHP Tokens <SplDSplDoublyLinkedList>[\PhpToken]
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
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
     * Wrapper for self::add() with type hint
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

    public function prepend(int idx, <PhpToken> token)
    {
        this->add(idx, token);
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
            let cls = "TKN"; //val::class;
            //if (val->id != \T_WHITESPACE)
            let tmp = tmp . idx . ": " . Stringify::fromTkn(val) . PHP_EOL;
            let idx ++;
            this->next();
        }
        return tmp;
    }
}
