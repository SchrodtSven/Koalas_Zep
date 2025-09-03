/**
 * Class parsing array|index|slice|stp [arguments] for 
 * array (sliced, keyed/indexed and opt. stpped by) 
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
    public function analyse(var idxslcstp) -> array
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