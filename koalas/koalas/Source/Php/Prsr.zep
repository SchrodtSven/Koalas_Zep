/**
 * Parser for PHP source code
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
 * @since 2025-08-29 
 */

namespace Koalas\Source\Php;

use Koalas\Core\Kql\Tknrz;
use Koalas\Source\Php\TknLst;
use PhpToken;

class Prsr
{
    private lst; // original list

    private prsd;  // parsed list

    private code = "";  // original source code

    public function __construct(string code)
    {
        let this->code = code;
        let this->lst = new TknLst(\PhpToken::tokenize(code));
        let this->prsd = new TknLst();
    }

    public function consume()
    {}

    public function peek(int idx) -> <PhpToken>
    {
        return this->lst[idx];
    }

    public function poke(int idx, <PhpToken> val) -> <Prsr>
    {
        let this->lst[idx] = val;
        return this;
    }

    public function prep(idx, <PhpToken> val) -> <Prsr>
    {
        this->lst->prepend(idx, val);
        return this;
    }

    public function del(int idx) -> <Prsr>
    {
        unset(this->lst[idx]);
        return this;
    }

    /**
     * Get the value of lst
     *
     * @return TknLst
     */
    public function getLst() -> <TknLst>
    {
        return this->lst;
    }


    /**
     * Sanitizing PHP var names (@[0]=='') to a generic form of variable name
     *
     * @return void
     */
    public function sanitzeVars() -> <Prsr>
    {
        int offs, i, last;
        var curr;
        let last = count(this->lst);
        let last --;
        let  offs = 0; 

        for i in range(offs, last) {
            let curr = this->lst[i];
            if (curr->id  == T_VARIABLE) {
                let curr->text = substr(curr->text, 1);
                let this->lst[i] = curr;
            }
        }
        return this;
    }

    public function find(int offs, mixed needle) -> int
    {
        var val, pos;
        let pos = 0;
        this->lst->rewind();
        while(this->lst->valid()) {
            let val = this->lst->current();
            if val->id == needle || val->text == needle {
                return pos;
            }
            let pos++;
        }
        return -1;
    }


    // public function filter(array criteria = [\T_WHITESPACE]): array
    // {
    //     var i, tmp;
    //     let tmp = [];
    //     for (i = 0; i < count(this->lst); i++) {
    //         if (!in_array(this->lst[i]->id, criteria)) {
    //             tmp[i] = this->lst[i];
    //         }
    //     }
    //     return tmp;
    // }

    // public function findNext(int|string tknId, int offset=0)
    // {

    //     for (i = offset; i < count(this->lst); i++) {
    //         if (this->lst[i]->id == tknId || this->lst[i]->text == tknId) {
    //             return i;
    //         }
    //     }
    //     return -1;
    // }

    // public function find(int|string tknId, int offset)
    // {
    //     for (i = offset; i < count(this->lst); i++) {
    //         if (this->lst[i]->id == tknId || this->lst[i]->text == tknId) {
    //             return i;
    //         }
    //     }
    //     return -1;
    // }

    

    // public function findBetween(int|string tknId, int offset, int last)
    // {
    //     for (i = offset; i < last; i++) {
    //         if (this->lst[i]->id == tknId || this->lst[i]->text == tknId) {
    //             return i;
    //         }
    //     }
    //     return -1;
    // }

    

    // /**
    //  * Preparse PHP token list for usage in Zephir
    //  *
    //  * @return self
    //  */
    // public function zephirize() -> <Prsr>
    // {
    //     for (i = 0; i < count(this->lst); ++i) {
    //     }
    //     return this;
    // }
}

