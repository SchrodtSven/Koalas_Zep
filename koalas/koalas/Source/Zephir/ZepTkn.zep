/**
 * Zephir Tokens - extending \PhpToken
 * 
 * @TODO check id => text in ZepTkn::sanitize()
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
 * @since 2025-08-29
 */

namespace Koalas\Source\Zephir;
use Koalas\Source\Generic\Stringify;
class ZepTkn extends \PhPToken
{
    const MIN_ID = 1024;
    const ERR_ID_BND = "Given ID is out of boundary: %s - use int >= %s"; 

    public function sanitize() -> void
    {
        if(this->id < ZepTkn::MIN_ID) {
            throw new \Exception(
                sprintf(ZepTkn::ERR_ID_BND, 
                        this->id, 
                        ZepTkn::MIN_ID));
        }
            
    }

    /**
     * Alternative to __toString() for debuggging etc.
     *
     */
    public function stringify() -> string
    {
        return Stringify::fromTkn(this);
    }
}
