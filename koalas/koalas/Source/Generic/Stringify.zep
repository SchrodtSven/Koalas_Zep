/**
 * Helper to be used within __toString() methods 
 * 
 * @TODO check id => text in self::sanitize
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
 * @since 2025-08-29
 */

namespace Koalas\Source\Generic;
use PhpToken;
use OutOfBoundsException;

class Stringify 
{
    public static function fromTkn(<PhpToken> tkn) -> string
    {
        var tmp, i;
        let tmp = "";
        //for i in array_keys(get_object_vars(tkn)) {
            let tmp = tmp . "id: " . (string) tkn->id . " ";
            let tmp = tmp . "text: '" . (string) tkn->text . "' ";
            let tmp = tmp . "line: " . (string) tkn->line . " ";
            let tmp = tmp . "pos: " . (string) tkn->pos . " ";
            let tmp = tmp . "name: " . (string) tkn->getTokenName();
        //}
        //let tmp = tmp . PHP_EOL;
        return tmp;

    }


}
