/**
 * Expression "LE" (less than or equals) - "<="
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.1
 * @since 2025-08-25
 */
namespace Koalas\Core\Kql\ExprType;
use Koalas\Core\Kql\Expr;

class Le extends Expr
{
    
    const OP = "<=";
    const OP_NM = "LE";
   
    public function __construct(array operands = [])
    {
        parent::__construct("LE", "<=", operands);
    }

   
}