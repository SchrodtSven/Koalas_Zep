/**
 * Entity class for expressions
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
 * @since 2025-08-25
 */
namespace Koalas\Core\Kql;

class Expr
{
    protected name = "" {
        get, set
    };

    protected type = "BINARY" {
        get, set
    };

    protected operands =  [] {
        get, set
    };

    protected operator = "==" {
        get, set
    };

    protected validOpCount = [0, 1, 2];

    const ERR_PARM_CNT = 'Wrong parameter count!';
    
    public function __construct(string name, string operator="", array operands = [])
    {
        let this->name = name;
        if operator != "" {
            let this->operator = operator; 
        }
        if (!in_array(count(operands), this->validOpCount)) {
            throw new \InvalidArgumentException(self::ERR_PARM_CNT);
        }
        if count(operands) {
            let this->operands = operands;
        }
    }


    public function __toString() -> string
    {
        return sprintf("%s %s %s",
                       this->operands[0],
                       this->operator,
                       this->operands[1]     
                    );
    }
}