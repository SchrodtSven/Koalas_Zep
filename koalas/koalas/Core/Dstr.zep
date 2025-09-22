/**
 * Defining API for Koalas specific data structures
 *
 * - Dataframe
 * - Series
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.3
 * @since 2025-09-03
 */

namespace Koalas\Core;
use Koalas\Core\Intl\IdxSlc;

interface Dstr
{
    public function readCsv(string fnm) -> <Dstr>;
    
    public function readJson(string fnm) -> <Dstr>;

    public function toCsv(string fnm) -> <Dstr>;

    public function toJson(string fnm) -> <Dstr>;

    
}