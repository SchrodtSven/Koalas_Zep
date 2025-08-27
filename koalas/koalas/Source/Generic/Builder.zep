/**
 * Helper class building source code snippets from data structures
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
 * @since 2025-08-25
 */
namespace Koalas\Source\Generic;
use Koalas\Source\Generic\Grammar;

class Builder
{


    public function getList(array dta, bool withCtx=false) -> string
    {
        var key, val;
        if withCtx {
            for key, val in dta { 
               let dta[key] = this->ctxVal(dta[key]);
            }
        }

        return implode(", ", dta);    
    }

    /**
     * Contextualize scalar value
    */
    public function ctxVal(val) -> string
    {
        switch (gettype(val)) {
            case "string":
                return sprintf("%s%s%s",
                        Grammar::DOUBLE_QUOTE,
                        val,
                        Grammar::DOUBLE_QUOTE)
                        ;
        }

        retun (string) val;
    }
}