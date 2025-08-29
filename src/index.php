<?php

require_once 'src/Autoload.php';

use Koalas\Source\Php\TknLst;
use Koalas\Source\Generic\Stringify;
use Koalas\Source\Php\Prsr;
use Koalas\Source\Zephir\ZepTkn;
$parser = new Prsr(file_get_contents('gen_tst_prse.php'));

$foo = $parser->getLst();
$foo->rewind();
$foo->next();
$foo->next();
$foo->next();
//[$foo->current(), $foo->key()]
//var_dump(count($foo));
$foo->gto(5);
try {
$bar = $foo->slc(3, 106);
} catch(\Exception $e){
    print $e->getMessage(). PHP_EOL;
} 
$bar = $foo->slc(3, 5);
$bar->unshift(new ZepTkn(1999, 'Crappy', 0, 0));
print($bar);


var_dump($bar[0] == $foo[3]);
var_dump($bar[1] == $foo[4]);
var_dump($bar[2] == $foo[5]);
var_dump($bar[3] == $foo[6]);