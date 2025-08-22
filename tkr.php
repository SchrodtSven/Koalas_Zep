<?php
use Koalas\Core\Kql\Tknrz;
//use PhpToken;


$tk = new PhpToken(T_WHITESPACE, '');

var_dump([$tk, $tk->getTokenName()]);




// exit(666);
$code = "foo >2.3";

$tknr = new Tknrz($code);

var_dump($tknr->filterWS()->getTokens());


var_dump(T_WHITESPACE);


