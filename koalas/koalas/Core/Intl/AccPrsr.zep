/**
 * Class parsing array|index|slice|stp [arguments] for 
 * array (sliced, keyed/indexed and opt. stepped by) 
 * access to lists
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
 * @since 2025-09-03
 */
namespace Koalas\Core\Intl;

class AccPrsr
{
    const SLC_SEP = ':';


    public  function anlze(var idxslc) -> array
    {
        var tmp = [], prts = [];

        
        if is_int(idxslc) {
            let tmp[] = idxslc; 
        } elseif is_numeric(idxslc) {
            let tmp[] = (int) idxslc; 
        } elseif is_string (idxslc) {
            if !str_contains(idxslc, ":") {
                let tmp[] = idxslc; 
            } else {
                
                let tmp = this->prseCln(idxslc);
            }
        }

        return tmp;
    }

    protected function prseCln(string acc)
    {
         var prtz = explode(":", acc);
         switch count(prtz) {
            case 2:
                let prtz[0] = (prtz[0] == "") // start
                                ? 0
                                : (int) prtz[0]; 

                let prtz[1] = (prtz[1] == "") // end
                                ? null
                                : (int) prtz[1]; 
                break;
                
            case 3:
                let prtz[0] = (prtz[0] == "") // start
                                ? 0
                                : (int) prtz[0]; 

                let prtz[1] = (prtz[1] == "") // end
                                ? null
                                : (int) prtz[1]; 
                                
                let prtz[2] = (prtz[2] == "") // step
                                ? 1
                                : (int) prtz[2]; 
         }

         return prtz;
    }

}