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
        this->app(mark)->prep(mark);

        return this;
    }

    public function app(string txt)
    {
        let this->cnt = this->cnt . txt;
        return this;
    }

    public function prep(string txt)
    {
        let this->cnt = txt . this->cnt;
        return this;
    }

    public function splitByWS() -> array
    {
        return preg_split("/\s+/", $this->cnt, -1, PREG_SPLIT_NO_EMPTY);
    }

     
    public function __toString() -> string
    {
        return this->cnt;
    }
}