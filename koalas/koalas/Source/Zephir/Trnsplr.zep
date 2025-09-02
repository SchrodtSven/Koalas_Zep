/**
 * Transpiling list of PHP Tokens to list of Zephir Tokens
 * -> bulding source code strings via 
 * 
 * <code>
 * implode('', lst->toArray());
 * </code>
 *
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
 * @since 2025-09-02
 */

namespace Koalas\Source\Zephir;
use Koalas\Source\Generic\Stringify;
use  Koalas\Source\Php\TknLst;

class Trnsplr extends \PhPToken
{
    private lst; // original list TknLst
    private prsd;  // parsed list TknLst
    private code = "";  // destination source code string (Zephir)

    public function __construct(TknList lst)
    {
        let this->lst = lst;
        let this->prsd = new TknLst();
    }
    

}
