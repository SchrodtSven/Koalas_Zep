/**
 * Class for managing native strings as instances
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.1
 * @since 2025-08-19
 */
namespace Koalas\Type;
use Koalas\Type;


class Str
{
    const QS = "'";
    protected cnt = "";

    public function __construct(cnt = "")
    {
        let this->cnt = cnt;
    }

    public function q(mark=self::QS)
    {
        let this->cnt = mark . this->cnt . mark;
        return this;
    }

     
    public function __toString()
    {
        return this->cnt;
    }
}