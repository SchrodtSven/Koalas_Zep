/**
 * (New) Dataframe prototype skeleton
 * 
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.3
 * @since 2025-09-22
 */
namespace Koalas\Lab;
 


class DFPrototype
{
    public loc; // <IdxSlc>
    public iloc; // <IdxSlc>

    
    protected colz = []; // column names are stored here
    protected col2idx [] // flipped array matching column names to index
    protected dta = []; // container for actual data

    protected idx = []; // named indices
    protected dtp = []; // data type of columns
    protected cp = []; // copy of data

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
        // public bcz to be used be4 construction

    }
}