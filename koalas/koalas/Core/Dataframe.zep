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
namespace Koalas\Core;

class Dataframe implements \Stringable
{
  

    public function __toString() -> string
    {
        return "Dataframe";
    }
}
