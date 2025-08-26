<?php

namespace Tests;

use PHPUnit\Framework\TestCase;
use PHPUnit\Framework\Attributes\DataProvider;
use PHPUnit\Framework\Attributes\TestWith;
use Koalas\Core\Kql\Tknrz;

class ParserTest extends TestCase
{

 
    #[DataProvider('tokenProvider')]     
       public function testTokenize(string $code, array $tokens)
    {
       $tokenizr = new Tknrz($code);
       $tok = $tokenizr->filterWS() 
                       ->getTokens();
       $this->assertSame(count($tok), count($tokens));
       while(count($tokens)) {
        $this->assertSame(array_shift($tokens), array_shift($tok)['name']);
       }

    }

    public static function tokenProvider(): array
    {
        return [
            ['id > 1024', ['T_STRING', '>', 'T_LNUMBER']],
            ['id == 1024', ['T_STRING', 'T_IS_EQUAL', 'T_LNUMBER']],
            ['country IN  ["DE", "FR"]', ['T_STRING', 'T_STRING', '[', 'T_CONSTANT_ENCAPSED_STRING', ',',  'T_CONSTANT_ENCAPSED_STRING', ']']]
        ];
    }
        
    
     
}