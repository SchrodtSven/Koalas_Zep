<?php

require_once 'src/Autoload.php';

use Koalas\Source\Php\TknLst;
use Koalas\Source\Generic\Stringify;
use Koalas\Source\Php\Prsr;
use Koalas\Source\Zephir\ZepTkn;
use Koalas\Source\Php\Fltr;
use Koalas\Type\Op\Filter;

Filter::BT;
$parser = new Prsr(file_get_contents('gen_tst_prse.php'));

$foo = $parser->getLst();
// var_dump([$foo[5]->id, $foo[5]->getTokenName()]);
// exit(233);
// $bar = (array) $foo;
// var_dump($bar);
// exit(233);
// foreach($foo as $itm) {
//     print Stringify::fromTkn($itm) . PHP_EOL;
// }

$fltr = new Fltr($foo);
$ws = $fltr->ne(\T_WHITESPACE);

foreach($ws as $itm) {
    print Stringify::fromTkn($itm) 
    . PHP_EOL;
}