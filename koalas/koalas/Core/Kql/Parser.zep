/**
 * Parser class for KQL
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.3
 * @since 2025-08-22
 */
namespace Koalas\Core\Kql;

class Parser
{

    const TXT_COL = "text";

    //@fixme: implment get/set with return type hints!
    protected tokenList = [] {
        get, set
    };

    protected parsedList = [] {
        get, set
    };

    public function __construct(array tokenList)
    {
        let this->tokenList = tokenList;
    }

    public function parse() -> bool
    {
        var curr, i, lstIdx;
        let lstIdx = count(this->tokenList); 
        let lstIdx --;
        for (i in range(0, lstIdx))
        {
            let curr = this->tokenList[i];
        }

        return false;
    }

    public function lookAhead(string fnd, int strt) -> int
    {
        var lst, i, end;
        let lst = array_column(this->tokenList, self::TXT_COL);
        let end = count(this->tokenList);
        let end --;        
        //for (i = strt;i<count(this->tokenList);i++) 
        for i in range(strt, end)
        {
            if(lst[i] == fnd) {
                return i;
            }
                
        }

        return -1;
    }

    public function findNext(string needle, int strt = 0) -> int
    {
        return array_search(needle, array_column(this->tokenList, self::TXT_COL));
    }

    public function consume(int offs) -> <Parser>
    {
        let this->tokenList = array_slice(this->tokenList, offs);
        return this;
    }

    /**
     * Slicing from token list /between/ strt and end params   
    */
    public function slice(int strt, int end) -> array
    {
        var offs, leng;
        let offs = strt +1;
        let leng = end - strt;
        let leng --;
        return array_slice(this->tokenList, offs, leng);
    }
}