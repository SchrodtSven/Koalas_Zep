/**
 * Class for tokenising given code 
 * 
 * - for now we are cheating a bit - using PHPs PhpToken::tokenize()
 * - suner|l8er we will implement it 'afoot'
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
 * @since 2025-08-22
 */
namespace Koalas\Core\Kql;
use PhpToken;

class Tknrz
{
    const PROLOGUE_CHEAT = "<?php";

    const ERR_404 = "File not found -> %s";

    private code = "" {
        get, set
    };

    private tokens = [];

    public function __construct(string code)
    {
        this->tokeniz(code);
    }

    public function tokeniz(string code) -> void
    {
        var tmp, newItm, itm;

        let this->code = self::PROLOGUE_CHEAT . " " . code;
        
        let tmp = PhpToken::tokenize(this->code);
        // getting rid of PHP prologue
        array_shift(tmp);

        for(itm in tmp) {
            let newItm = get_object_vars(itm);
            let newItm["name"] = itm->getTokenName();
            let this->tokens[] = newItm; 
    
        }
    }

    public function filterWS() -> <Tknrz>
    {
        let this->tokens = array_filter(this->tokens, function(itm) {
            return (itm["id"] != T_WHITESPACE);
        });

        return this;
    }

    public function getTokens() -> array
    {
        return this->tokens;
    }
    
    public static function natTokenize(string fnm) -> array
    {
         if !file_exists(fnm) {
            throw new \InvalidArgumentException(sprintf(Tknrz::ERR_404, fnm));
        }
        return PhpToken::tokenize(file_get_contents(fnm));
        
    }

    

}
