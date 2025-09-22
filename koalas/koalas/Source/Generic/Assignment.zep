/**
 * Entity class for assignements 
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.3
 * @since 2025-08-25
 */
namespace Koalas\Source\Generic;
use Koalas\Source\Generic\Grammar;
use Stringable;
class Assignment
{
    protected left = "";

    protected right = "";

    public function __construct(var left="", var right="")
    {
        let this->left = (string) left;
        let this->right = (string) right;
    }

    public function __toString() -> string
    {
        return sprintf("%s %s %s", 
                                this->left,
                                Grammar::ASN_SGN,
                                this->right
                            );
    }
}