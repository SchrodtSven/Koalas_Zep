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
use  Koalas\Source\Generic\Grammar;

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

    public function begins(string txt) -> bool
    {
        return str_starts_with(this->cnt, txt);
    }
    
    public function ends(string txt) -> bool
    {
        return str_ends_with(this->cnt, txt);
    }

    public function contains(string txt) -> bool
    {
        return str_contains(this->cnt, txt);
    }

    public function substr(int start, int length=null, string encoding = null)
    {
        return mb_substr(this->cnt, start, length, encoding);
    }

    public function substrCount(string needle, string encoding = null) -> int
    {
        return mb_substr_count(this->cnt, needle, encoding);
        
    }

    public function __toString()
    {
        return this->cnt;
    }

    // Tranforming 

    /* Splitting string at UpperCasedSubstrings
     *
     * @param string string
     * @return ListClass
     */
    public function splitOnUpperCaseSubstring() -> array
    {
        return preg_split("/(?=[A-Z])/", this->cnt, - 1, PREG_SPLIT_NO_EMPTY);
    }

    /**
     * Transforming string separated by sep into camelCasedString
     * @FIXME 
     * @param string text
     * @param string sep
     * @return self
     */
    public function camelize(string sep = "_", bool lf = true)
    {
        var tmp, first, itm;

        let tmp = this->splitBy(sep);
     
        let first = (new Str(array_shift(tmp)))->lower();

        for(itm in tmp) {
            let itm = (new Str(itm))->lower()->upperFirst();
        };
     
        return (lf) 
                    ? first->app(join(tmp, ""))
                    : first->app(join(tmp, ""))->upperFirst();
    }
     
    /**
     * Transforming camelCasedString to snake_cased_string
     *
     * @param string string
     * @param boolean lc
     * @return self
     */
    public function snakify(bool lc= true, string glue ="_")
    {
        return (join(this->splitOnUpperCaseSubstring(), glue)->lower());
    }

    /**
     * Transforming first character to upper case
     *
     * @return self
     */
    public function upperFirst()
    {
        
        let this->cnt = ucfirst(this->cnt);
        return this;
    }

    /**
     * Transforming first character to lower case 
     *
     * @return self
     */
    public function lowerFirst()
    {
        
        let this->cnt = lcfirst(this->cnt);
        return this;
    }

    public function upper()
    {
        
        let this->cnt = strtoupper(this->cnt);
        return this;
    }

    public function lower()
    {
        
        let this->cnt = strtolower(this->cnt);
        return this;
    }

    public function matchEnd(string start) -> string
    {
        switch(start) {

            case Grammar::CHEVRONS_START:
                return Grammar::CHEVRONS_END;
            
            case Grammar::PARENTHESES_START:
                return Grammar::PARENTHESES_END;

            case Grammar::BRACES_START:
                return Grammar::BRACES_END;

            case Grammar::BRACKETS_START:
                return Grammar::BRACKETS_END;

            default:
                return start;
        }
        return start;
    }

    public function enclose(string start) -> string
    {
        return (sprintf("%s%s%s", start, this->cnt, this->matchEnd(start)));
    }
}