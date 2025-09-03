/**
 * Class representing a data structure called Dataframe - consisting of 
 *
 * - columns
 * - rows
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
 * @since 2025-08-19
 */
namespace Koalas\Type;
use Koalas\Core\Dstr;
use Koalas\Core\Intl\IdxSlc;

class Dataframe implements \Stringable, Dstr
{
  


    public loc; // <IdxSlc>

    public iloc; // <IdxSlc>

    public function __toString() -> string
    {
        return "Dataframe";

        
    }

    public function readCsv(string $fnm)
    {}

    public function readJson(string $fnm)
    {}

    public function toCsv(string $fnm)
    {}

    public function toJson(string $fnm)
    {}


}
