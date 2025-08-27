/**
 * Class representing a data structure called Dataframe - consisting of 
 *
 * - columns
 * - rows
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
 * @since 2025-08-19
 */
namespace Koalas\Core;

class Dataframe implements \Stringable
{
    protected  errArrLength = "All arrays must be of the same length";

    protected dta = [] {
        get, set
    };
    
    protected cols = [] {
        get, set
    };

    public length = 0 {
        get, set
    };

    protected sizes = [] {
        get, set
    };

    protected orig = [] {
        get, set
    };
    
    public function __construct(dta = [])
    {
        let this->orig = dta;
        let this->cols = array_keys(dta);
        let this->length = count($this->orig[this->cols[0]]);
        this->analyze();
        this->reorg();
    }
    
    protected function reorg() -> void
    {
        var tmp =[];
        var i, key, lst;
        let lst = this->length;
        let lst --;
        for i in range(0, lst) {
            for  key in this->cols {
                array_push(tmp, this->orig[key][i]);
            }
            array_push(this->dta, tmp);
            let tmp = [];
        }
    }

    public function analyze() -> void
    {
        
       
       var sizes = []; 
       var cn ="";
        
        for cn in this->cols {
            let sizes[cn] = count(this->dta[cn]);    
        }

        let this->sizes = sizes;

         if (min(sizes) != max(sizes)) {
            throw new \Exception(this->errArrLength);
        }
    }

    public function __toString() -> string
    {
        return "Dataframe";
    }
}
