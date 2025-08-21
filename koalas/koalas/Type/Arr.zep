/**
 * Class for managing native arrays as instances
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.1
 * @since 2025-08-20
 */
namespace Koalas\Type;
use Koalas\Type;


class Arr
{
    
    protected dta = [];

    public function __construct(dta = [])
    {
        let this->dta = dta;
    }

    public function slice (int offset, int length = null, bool preserve_keys = false)
    {
        return array_slice(this->dta, offset, length, preserve_keys);
    }
}