<?php

require_once 'src/Autoload.php';
use SchrodtSven\Koalas\Source\Zephir\ZepToken;
use SchrodtSven\Koalas\Source\Php\Prsr;

$parser = new Prsr(file_get_contents('gen_tst_prse.php'));
$parser->sanitzeVars();
$tknz = $parser->filter([
    T_OPEN_TAG,
    T_CLOSE_TAG, 
    //\T_WHITESPACE
]);
//$parser->unset(2);
foreach($tknz as $idx => $val) {
    $ln = implode(' : ', get_object_vars($val));
    $cls = $val::class;
    if ($val->id != \T_WHITESPACE)

        echo "{$idx}: {$ln} {$val->getTokenName()} - {$cls}\n";
}
$os = $parser->findNext("{");
$lst = $parser->findNext("}");
//print_r([$os, $lst]);
$nxt = $parser->findBetween(\T_VARIABLE, $os, $lst);

print_r([$os, $lst, $nxt]);
$prev = $parser->peek($nxt);
$parser->prep($nxt, new ZepToken(1024, 'let', $prev->line, $prev->pos));
$prev = $parser->peek($nxt+1);
$parser->prep($nxt+1, new ZepToken(\T_WHITESPACE, ' ', $prev->line, $prev->pos));
//T_WHITESPACE
echo implode('', $parser->filter([
    T_OPEN_TAG,
    T_CLOSE_TAG, 
    //\T_WHITESPACE
])).PHP_EOL;
//  echo implode(',', array_keys($tknz)).PHP_EOL;


//var_dump($parser->getLst());
echo $parser->getLst();

echo (implode("", $parser->filter([])));


print_r(get_object_vars($parser->peek(24)));

$tkn = new ZepToken(1024, 'let', 23, 666);
echo $tkn->stringy();