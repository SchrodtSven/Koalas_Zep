/**
 * Expression "GE" (greater than or equals) - ">="
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.1
 * @since 2025-08-25
 */
namespace Koalas\Core\Kql\ExprType;
use Koalas\Core\Kql\Expr;

class Ge extends Expr
{
    
    const OP = '>=';
    const OP_NM = 'GE';
   
    public function __construct(array operands = [])
    {
        parent::__construct(self::OP_NM, self::OP, operands);
    }

   
}