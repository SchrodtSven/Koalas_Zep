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
    protected vldTypz = ["BINARY", "TERNARY", "POSTFIX", "PREFIX"];

    protected name = "";

    protected type = "BINARY";

    protected operands =  [];

    protected operator = "==";

    protected validOpCount = [0, 1, 2];

    const ERR_PARM_CNT = 'Wrong parameter count!';
    
    public function __construct(string name, string operator="", array operands = [])
    {
        let this->name = name;
        if operator != "" {
            let this->operator = operator; 
        }
        if (!in_array(count(operands), this->validOpCount)) {
            throw new \InvalidArgumentException(Expr::ERR_PARM_CNT);
        }
        if count(operands) {
            let this->operands = operands;
        }
    }

    public function getName() -> string
    {
        return this->name;
    }

    public function getType() -> string
    {
        return this->type;
    }

    public function getOperands() -> array
    {
        return this->operands;
    }

    public function getOperator() -> string
    {
        return this->operator;
    }

    public function getValidOpCount() -> string
    {
        return this->validOpCount;
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