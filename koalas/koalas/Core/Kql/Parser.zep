/**
 * Parser dlass for KQL
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.1
 * @since 2025-08-22
 */
namespace Koalas\Core\Kql;

class Parser
{

    protected tokenList = [] {
        get, set
    };

    protected parsedList = [] {
        get, set
    };

    public function __construct(array $tokenList)
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

}