/**
 * Accessor for indexing/slicing(stepping)
 *
 * - Dataframe
 * - Series
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
 * @since 2025-09-03
 */

namespace Koalas\Core\Intl;
use Koalas\Core\Intl\AccPrsr;
use Koalas\Core\Dstr;

class IdxSlc implements  \ArrayAccess 
{
      // Implementing \ArrayAccess 

    protected strt = 0;

    protected end = 0;

    protected stp = 1; 

    protected acc = "";

    protected prsr;

    protected dta = [];

    protected colz = [];

    protected isVSlc = false;  // flag for vertical slicing (“columns”)

    protected isHSlc = false; // flag for horizonal slicing (“rows”)

    protected dstr = null;

    public function __construct(<Dstr> dstr = null)
    {
        let this->dstr = dstr;
        let this->prsr = new AccPrsr();
    }

    public function offsetSet(acc, value) -> void 
    {
        let this->acc = acc;
        this->prse();
        if (is_null(acc)) {
            this->dstr->set(null, value);
        } else {
            this->dstr->set(acc, value);
        }
    }

    public function offsetExists(acc) -> bool 
    {
        let this->acc = acc;
        this->prse();
        return isset(this->dstr->getDta()[acc]);
    }

    public function offsetUnset(acc) -> void 
    {
        let this->acc = acc;
        this->prse();
        unset(this->dstr->getDta()[acc]);
    }

    public function offsetGet(acc) -> mixed 
    {
        let this->acc = acc;
        this->prse();
        
        if this->isVSlc {
            return this->dstr->slc(this->strt, this->end);
        } else {
            return isset(this->dstr->getDta()[acc]) ? this->dstr->getDta()[acc]  : null;
        }

       
        
    }

    protected function prse()
    {   
        if is_array(this->acc) {
            let this->colz = this->acc;
            let this->isHSlc = true;
            return true;
        }

        var prtz = this->prsr->anlze(this->acc);
        switch count(prtz) {
            
            case 1:
                let this->strt = prtz[0];
                let this->end = prtz[0];
                break;

            case 2:
                let this->strt = prtz[0];
                let this->end = prtz[1];
                let this->isVSlc = true;
                // if  !is_null(this->end) {
                //     let this->end--;
                // }
                break;
                
            default: 
                let this->strt = prtz[0];
                let this->end = prtz[1]; 
                let this->isVSlc = true;
                // if  !is_null(this->end) {
                //     let this->end--;
                // }
                let this->stp = prtz[2];   
         }

         return true;

    }

    public function __toString() -> string
    {
        return var_export(this, true);
    }

    public function getMta() -> array
    {
        return [
            "start": this->strt,
            "end": this->end,
            "step": this->stp,
            "columns": this->colz
        ];
    }

}