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
        return preg_split("/\s+/", this->cnt, -1, PREG_SPLIT_NO_EMPTY);
    }

    public function splitBy(string sep) -> array
    {
        return explode(sep, this->cnt);
    }

    public function replace(fnd, rpl = "")
    {
        let this->cnt = str_replace(fnd, rpl, this->cnt);
        return this;
    }

    /**
     * Getting sub string enclosed by start and end 
     * - start and end will be quoted for regex context
     * 
     * @param string start 
     * @param string end 
     * @return self
     */
    public function stringsBetween(string start, string end)
    {
        var start, end, pattern, txt;
        let start = preg_quote(start);
        let end = preg_quote(end);
        let pattern = "/{start}(.*){end}/U"; // ungreedy modififer
        preg_match_all(pattern, this->cnt, txt);
        //@FIXME -> error detection
        let this->cnt = txt[1][0];
        return this;
    }
    
    public function __toString() -> string
    {
        return this->cnt;
    }
}