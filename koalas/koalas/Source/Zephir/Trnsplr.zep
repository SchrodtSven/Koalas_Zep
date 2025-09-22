/**
 * Transpiling list of PHP Tokens to list of Zephir Tokens
 * -> bulding source code strings via 
 * 
 * <code>
 * implode('', lst->toArray());
 * </code>
 *
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.3
 * @since 2025-09-02
 */

namespace Koalas\Source\Zephir;
use Koalas\Source\Generic\Stringify;
use Koalas\Source\Php\TknLst;
use Koalas\Source\Php\Prsr;

class Trnsplr
{
    private lst; // original list <TknLst>
    private prsd; // parsed list <TknLst>
    private prsr; // parsed list <Prsr>
    private code = "";  // destination (Zephir) source code string 

    public function __construct(<Prsr> prsr)
    {
        let this->prsr = prsr;
        this->prsr->sanitzeVars();
        let this->prsd = new TknLst();
    }

    public static function fromFile(string fnm) -> <Trnsplr>
    {
        if !file_exists(fnm) {
            throw new \InvalidArgumentException(sprintf("File not found: %s", fnm));
        }
        return new self(new Prsr(file_get_contents(fnm)));
    }

    public static function fromStr(string code) -> <Trnsplr>
    {
        return new self(new Prsr(code));
    }

}
