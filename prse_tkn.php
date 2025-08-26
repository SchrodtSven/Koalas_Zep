<?php

use Koalas\Core\Kql\Tknrz;

$code = "foo(1, 3, 43)";

 $tokenizr = new Tknrz($code);
       $tok = $tokenizr->filterWS() 
                       ->getTokens();



function lookAhead(string $fnd, int $strt): int
{
    global $tok;
    $lst = array_column($tok, 'text');

    for ($i = $strt;$i<count($tok);$i++) 
    {
        if($lst[$i] == ')')
            return $i;
    }

    return -1;
}
$s = array_search('(', array_column($tok, 'text'));
$e = lookAhead(')', $s );

$inParen = array_slice($tok, $s+1, $e - $s -1);

echo implode('', array_column($inParen, 'text'));