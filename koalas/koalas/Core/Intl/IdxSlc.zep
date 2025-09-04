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

    public function __construct()
    {
        let this->prsr = new AccPrsr();
    }

    public function offsetSet(acc, value) -> void 
    {
        let this->acc = acc;
        this->prse();
        if (is_null(acc)) {
            let this->dta[] = value;
        } else {
            let this->dta[acc] = value;
        }
    }

    public function offsetExists(acc) -> bool 
    {
        let this->acc = acc;
        this->prse();
        return isset(this->dta[acc]);
    }

    public function offsetUnset(acc) -> void 
    {
        let this->acc = acc;
        this->prse();
        unset(this->dta[acc]);
    }

    public function offsetGet(acc) -> mixed 
    {
        let this->acc = acc;
        this->prse();
        return isset(this->dta[acc]) ? this->dta[acc]  : null;
    }

    protected function prse()
    {   if is_array(this->acc) {
            let this->colz = this->acc;
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
                if  !is_null(this->end) {
                    let this->end--;
                }
                break;
                
            default:
                let this->strt = prtz[0];
                let this->end = prtz[1]; 
                if  !is_null(this->end) {
                    let this->end--;
                }
                let this->stp = prtz[2];   
         }

         return true;

    }

    public function __toString() -> string
    {
        return implode("", this->dta);
    }

}