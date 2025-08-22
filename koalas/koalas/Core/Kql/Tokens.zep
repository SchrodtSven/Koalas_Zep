/**
 * Class for KQL tokens
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.1
 * @since 2025-08-22
 */
namespace Koalas\Core\Kql;

class Tokens
{
    const ASN = "="; // assignment
    const EQ = "=="; // equals
    const NE = "!="; // not equals

    const GT = ">"; // greater than
    const LT = "<"; // less than

    const GE = ">="; // greater than or equals
    const LE = "<="; // less than or equals

    const SW = "^"; // starts with
    const EW = "$"; // ends with

    const CT = "contains"; // contains
    const BT = "between"; // between

    const MIN = "min"; // min()
    const MAX = "max"; // max()

    const ISIN = "in"; //  in() 
    const NIN = "not in"; // not in() 

    protected funx = [] {
        get
    };

    public function __construct()
    {
        let this->funx = [self::CT, self::BT, self::MAX, self::MIN, self::ISIN, self::NIN];
    }

}