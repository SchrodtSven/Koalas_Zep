/**
 * Expression ">" (greater than) 
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.3
 * @since 2025-08-25
 */
namespace Koalas\Core\Kql\ExprType;
use Koalas\Core\Kql\Expr;

class Gt extends Expr
{
    
    const OP = ">";
    const OP_NM = "GT";
   
    public function __construct(array operands = [])
    {
        parent::__construct("GT", ">", operands);
    }

   
}