/**
 * Class for managing native arrays as instances
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.1
 * @since 2025-08-20
 */
namespace Koalas\Type;
use Koalas\Type;


class Arr
{
    const ERR_404 = "File not found: %s";

    protected dta = [];

    public function __construct(dta = [])
    {
        let this->dta = dta;
    }

    public function slice (int offset, int length = null, bool preserve_keys = false) -> array
    {
        return array_slice(this->dta, offset, length, preserve_keys);
    }

    // alias for slice
    public function rows (int offset, int length = null, bool preserve_keys = false) -> array
    {
        return array_slice(this->dta, offset, length, preserve_keys);
    }

    public function cols(string col) -> array
    {
        return array_column(this->dta, col);
    }

    public function walk(clj) -> <Arr>
    {
        array_walk(this->dta, clj);
        return this;
    }

    public function map(clj) -> array
    {
        return array_map(this->dta, clj);
    }




    public function raw() -> array
    {
        return this->dta;
    }

    public static function fromJson(string file) -> <Arr>
    {
        if (!file_exists(file)) {
             throw new \Exception(sprintf(self::ERR_404, file));
        } else {
            return new self(json_decode(file_get_contents(file), true));
        } 

    }
}