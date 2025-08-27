/**
 * Parse helper class for KQL - used to get code snippets (string $snp) to KQL native Entity types
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
 * @since 2025-08-27
 */
namespace Koalas\Core\Kql;
use Koalas\Core\Kql\Entity\Lst;
use Koalas\Source\Generic\Builder;
use Koalas\Core\Kql\Tokens;
class ParseHelper
{
    
    public function toLst(string snp) -> <Lst>
    {
        var tmp;
        let tmp = [];

        if(str_contains(snp, ',')) {
            let tmp = explode(',', snp);
        } else {
            let tmp = [snp];
        }
        
        return new Lst(tmp);
    }

    public function parseAsgn(string snp)
    { 
        
    }
    
    public function __construct()
    {}
}