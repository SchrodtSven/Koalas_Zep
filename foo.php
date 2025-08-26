<?php

use Koalas\Type\Str;
use Koalas\Source\Generic\Builder;
use Koalas\Source\Generic\Assignment;
use Koalas\Core\Kql\Tknrz;
use Koalas\Type\Arr;

$code = "country in ['DE', 'FR']";

$code = "id > 1024";
$code = 'country IN  ["DE", "FR"]';

$tokenizr = new Tknrz($code);
$tokens =  $tokenizr->filterWS() 
        ->getTokens();


var_dump(
       $tokens
    );

$myArr = new Arr(array_column($tokens, 'name'));

 function quoteListByMap(Arr $tokens): array 
 {
    return $tokens->map(function($itm) {
        return "'{$itm}'";
    });
    
 }   
var_dump(quoteListByMap($myArr));
//echo (implode(', ', quoteListByMap($myArr)));