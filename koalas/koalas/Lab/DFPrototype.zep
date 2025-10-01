/**
 * (New) Dataframe prototype skeleton
 * 
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.4
 * @since 2025-09-22
 */
namespace Koalas\Lab;
 
use Koalas\Type\Lst;
use Koalas\Core\Intl\IdxSlc;

class DFPrototype extends Lst
{
    // public members for direct access as object property
    public loc; // <IdxSlc>
    public iloc; // <IdxSlc>

    
    protected colz = []; // column names are stored here
    protected col2idx = []; // flipped array matching column names to index
    protected dta = []; // container for actual data

    protected idx = []; // named indices
    protected dtp = []; // data type of columns
    protected cp = []; // copy of data


    public function __construct(array dta = [])
    {
        let this->loc = new IdxSlc();
        let this->iloc = new IdxSlc(); // SHOULD be deprecated ??
        let this->dta = dta;
        if count(dta) {
            this->anlze(dta);
        }
    }

    /**
     *
     * Magical interceptor method allowing usage of property access operator (->)
     */
    public function __get(string val)
    {
        if isset this->dta[val] {
            return this->dta[val];
        } else {
            return [];
        }
    }

    public function anlze(array dta)
    {
        //@TODO analyze given data structure:
        // - dimensions?

    }
}