/**
 * Collection of methods operating on numbers, data that could be pared as numbers
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.3
 * @since 2025-08-26
 */
namespace Koalas\Type\Op;

class Numberizr
{
    public function determineType(var num) 
    {
        
        if !is_numeric(num) {
            return null;
        } else {
            var fv, iv;
            let iv = (int) num, fv = (float) num;
            if (iv == fv) {
                return iv; 
            } else {
                return fv;
            }
        }

        
    }
    
}
