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
    private lst; // original list TknLst

    private prsd;  // parsed list TknLst

    private code = "";  // original source code string

    public function __construct(string code)
    {
        let this->code = code;
        let this->lst = new TknLst(PhpToken::tokenize(code));
        this->lst->shift();
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
     * Sanitizing PHP var names if(@[0]=="$") to a generic form of variable name
     *
     * @return void
     */
    public function sanitzeVars() -> <Prsr>
    {
        int offs = 0, pos = 0, last = count(this->lst);;
        var curr;
        
        let last --, offs = 0; 

        this->lst->rewind();
        while(this->lst->valid()) {
            let curr = this->lst->current();
            if curr->id == T_VARIABLE {
                let curr->text = substr(curr->text, 1);
                this->lst->offsetSet(pos, curr);
            }
            this->lst->next();  
            let pos++;
            
        }


        
        return this;
    }

    public function find(var hays, int offs = 0 ) -> int
    {
        var curr;
        if !is_array(hays) {
            let hays = [hays];
        }
        this->adjOffs(offs);
        while(this->lst->valid()) {
            let curr = this->lst->current();
            if in_array(curr->id, hays) ||in_array (curr->text, hays) {
                return this->lst->key();
            }
            this->lst->next();
        }
        return -1;
    }

    public function findBetween(var needle, var val = ";", int offs = 0) -> int
    {
        var last, curr;
        this->adjOffs(offs);
           
        let last = this->find(val, offs);

        while(this->lst->key() <= last) {
            let curr = this->lst->current();
             if curr->id == needle || curr->text == needle {
                return this->lst->key();
            }
            this->lst->next();
        }

        return -1;
    }

    public function adjOffs(int offs) -> void
    {
        if offs == 0 {
            this->lst->rewind();
        } else {
             this->lst->gto(offs);
        }
    }
}

