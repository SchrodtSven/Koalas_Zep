<?php

use Koalas\Type\Str;
use Koalas\Source\Generic\Builder;
use Koalas\Source\Generic\Assignment;
use Koalas\Core\Kql\Tknrz;
use Koalas\Type\Arr;

$code = 'country IN  ("DE", "FR")';
$code = 'ISO-2 == "FR"';
$tokenizr = new Tknrz($code);
$tokens =  $tokenizr->filterWS() 
                     ->getTokens();


foreach( $tokens as $tkn) {
   print ("{$tkn['name']}: {$tkn['text']}" . PHP_EOL);
   
}

