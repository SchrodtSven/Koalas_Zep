/**
 * Entity class for assignements 
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.1
 * @since 2025-08-25
 */
namespace Koalas\Source\Generic;
use Koalas\Source\Generic\Grammar;

class Assignment
{
    protected left = "" {
        get, set
    };

    protected right = ""{
        get, set
    };

    public function __toString() -> string
    {
        return sprintf("%s %s %s", 
                                this->left,
                                Grammar::ASN_SGN,
                                this->right
                            );
    }
}