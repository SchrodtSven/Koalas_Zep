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

        // @FIXME  if is_array(idxslc) return this->anlzeArr(idxslc)
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

    /**
     * accessors (idxslcstp) be like 
     * 
     * - 'index/key' | 
     * - 'strt:end:stp', OR opened:
     * - '1:'
     * - ':2'
     * - '::2'
     * - '1::2'
     * 
     * @param var idxslc
     * @return array
     */
    public deprecated function analyse(var idxslcstp) -> array
    {
        if(is_int(idxslcstp)) {
            return [idxslcstp];
        }
        
        var tmp = [], parts = [], stp = 1, strt = 0, end = 0, last=strlen(idxslcstp);
        let last --;

        if(!strstr((string) idxslcstp, self::SLC_SEP)) {
            if(is_numeric(idxslcstp)) {
               let tmp = [(int) idxslcstp];
            } else {
                let tmp = [idxslcstp];
            }
        } else {
            let parts =  explode(self::SLC_SEP, idxslcstp);
            let stp = 1;
            let strt = (int) parts[0];
            let end = (int) parts[1];

            if(strpos(idxslcstp, self::SLC_SEP) == 0 ) {
                let tmp = [0,end];
            } elseif(strpos(idxslcstp, self::SLC_SEP) != last) {
                let tmp = [strt, end];
            } else {
                let tmp = [strt, null];
            }

            if(count(parts)>2) {
                let stp = (int) parts[2];
                let tmp = [strt, end, stp];
            }
        }

        return tmp;
    } 
    
  
}