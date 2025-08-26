<?php
use Koalas\Core\Kql\Parser;
use Koalas\Core\Kql\Tknrz;
$code = 'gr in (2, 45, 66) AND (fe>23)';
$t = new Tknrz($code);

$p = new Parser($t->filterWS()->getTokens());
$op = "(";
$cl = ")";

$tok = $t->getTokens();
$st = $p->findNext($op);



$en = $p->lookAhead($cl, $st);
$inPar = $p->slice($st, $en);
print (implode('', array_column($inPar, "text")));
$p->consume($en);

var_dump($t->getTokens());



