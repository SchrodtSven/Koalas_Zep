<?php
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
$p->consume($en +1);

var_dump($p->getTokenList());

$st = $p->findNext($op);



$en = $p->lookAhead($cl, $st);
$inPar = $p->slice($st, $en);

print(implode(array_column($inPar, 'text')));

