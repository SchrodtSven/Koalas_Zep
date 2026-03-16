/**
 * Accessor for indexing/slicing(stepping)
 *
 * - Dataframe
 * - Series
 * - Classes implementing \Koalas\Core\Dstr
 *
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.4
 * @since 2025-09-03
 */

namespace Koalas\Core\Intl;
use Koalas\Core\Intl\AccPrsr;
use Koalas\Core\Dstr;

class IdxSlc implements  \ArrayAccess 
{
      // Implementing \ArrayAccess 

    protected strt = 0; // start index

    protected end = 0; // end index

    protected stp = 1; // to be stepped by

    protected acc = ""; // accessor literal 

    protected prsr; // instance of  \Koalas\Core\Intl\AccPrsr

    protected dta = []; // pure data [rows][colz] as list of lists

    protected colz = []; // column names

    protected isVSlc = false;  // flag for vertical slicing (“columns”)

    protected isHSlc = false; // flag for horizonal slicing (“rows”)

    protected dstr = null; // Data structure

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

        var prtz = this->prsr->analyze(this->acc);
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