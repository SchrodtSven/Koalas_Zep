/**
 * Entity class handling numbers 
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
 * @since 2025-08-26
 */
namespace Koalas\Core\Kql\Entity;
use Koalas\Type\Op\Numberizr;

class Num
{
    protected numberizr;

    protected val = 0 {
        get, set
    };

    protected type = "" {
        get, set
    };
    
    public function __construct(var val) 
    {
        
        let this->val = val;
        let this->type = gettype(val);
        
        if !in_array(this->type, ["integer", "float", "double"]) {
                let this->numberizr = new Numberizr();
                var newVal;
                let newVal = this->numberizr->determineType(val);
                let this->val = newVal;
                let this->type = gettype(newVal);
        }
        
        if this->type == "double" {
                let this->type =  "float";
        }
        
    }
}