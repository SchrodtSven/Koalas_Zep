/**
 * Class representing list of PHP Tokens <SplDSplDoublyLinkedList>[\PhpToken]
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
 * @since 2025-08-28
 */
namespace Koalas\Source\Php;
use Koalas\Core\Kql\Entity\Lst;

class TknLst extends Lst
{
    public function __construct(array dta = [])
    {
        var itm;
        let this->dta = new \SplDoublyLinkedList();
        let this->pos = 0;
        for itm in dta {
            this->push(itm);
        }
    }
    
}
