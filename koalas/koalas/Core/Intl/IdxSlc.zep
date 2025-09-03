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
    {
        var_dump(this->prsr->analyse(this->acc));

    }

    public function __toString() -> string
    {
        return implode("", this->dta);
    }

}