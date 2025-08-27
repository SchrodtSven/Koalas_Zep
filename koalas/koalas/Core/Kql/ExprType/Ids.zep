/**
 * Expression "IDS" (is identical) - "==="
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
 * @since 2025-08-25
 */
namespace Koalas\Core\Kql\ExprType;
use Koalas\Core\Kql\Expr;

class Ids extends Expr
{
    
    const OP = "===";
    const OP_NM = "IDS";
   
    public function __construct(array operands = [])
    {
        parent::__construct("IDS", "===", operands);
    }

   
}