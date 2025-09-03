/**
 * Defining API for Koalas specific data structures
 *
 * - Dataframe
 * - Series
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
 * @since 2025-09-03
 */

namespace Koalas\Core;
interface Dstr
{
    public function readCsv(string fnm);
    
    public function readJson(string fnm);

    public function toCsv(string fnm);

    public function toJson(string fnm);

    public function loc(array slcIdx);

    public function iloc(array slcIdx);
}