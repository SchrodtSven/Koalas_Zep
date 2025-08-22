/**
 * Class for tokenising given code 
 * 
 * - for now we are cheating a bit - using PHPs PhpToken::tokenize()
 * - suner|l8er we will implement it 'afoot'
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.1
 * @since 2025-08-22
 */
namespace Koalas\Core\Kql;
use PhpToken;

class Tknrz
{
    const PROLOGUE_CHEAT = "<?php";

    private code = "" {
        get, set
    };

    private tokens = [] {
        get 
    };

    public function __construct(string code)
    {
        this->tokeniz(code);
    }

    public function tokeniz(string code)
    {
        var tmp, newItm, itm;

        let this->code = self::PROLOGUE_CHEAT . " " . code;
        
        let tmp = PhpToken::tokenize(this->code);
        array_shift(tmp);

        for(itm in tmp) {
        // print(implode(' : ', get_object_vars(itm))) . PHP_EOL;
            let newItm = get_object_vars(itm);
            let newItm["name"] = itm->getTokenName();
            let this->tokens[] = newItm; 
    
        }
    }

    public function filterWS()
    {
        let this->tokens = array_filter(this->tokens, function(itm) {
            return (itm["id"] != T_WHITESPACE);
        });

        return this;
    }
    

}
