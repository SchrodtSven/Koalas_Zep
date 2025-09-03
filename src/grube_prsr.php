<?php

require_once 'src/Autoload.php';

use Koalas\Source\Php\TknLst;
use Koalas\Source\Generic\Stringify;
use Koalas\Source\Php\Prsr;
use Koalas\Source\Zephir\ZepTkn;
use Koalas\Source\Php\Fltr;
use Koalas\Type\Op\Filter;



// var_dump(get_extension_funcs("zephir_parser"));

// die;
Filter::BT;
//$parser = new Prsr(file_get_contents('gen_tst_prse.php'));
$parser = new Prsr(file_get_contents('ex_src/for.php'));
$parser->sanitzeVars();
$foo = $parser->getLst();
echo $foo;
echo $foo->toCode();





die;
//print(implode('', $foo->toArray()));
$p = $parser->find([\T_PUBLIC, \T_PROTECTED, \T_PRIVATE]);
var_dump([$p, 'T_PROTECTED', 0]);
//$t = $parser->find(';', $p);
//var_dump([$t, ';', $p]);
$s = $parser->find(\T_STRING, $p);
var_dump([$s, '\T_STRING', $p]);
//$foo->del($s);
echo implode('', $foo->toArray());


var_dump(\T_OBJECT_OPERATOR);
exit(23);


//$t = $parser->findBetween(\T_STRING, ";", $parser->find(\T_PUBLIC));
var_dump($t);exit(666);
var_dump([$t, $parser->peek($t)]);



//$foo->del(18);
echo $foo;
// var_dump([$foo[5]->id, $foo[5]->getTokenName()]);
// exit(233);
// $bar = (array) $foo;
// var_dump($bar);
// exit(233);
// foreach($foo as $itm) {
//     print Stringify::fromTkn($itm) . PHP_EOL;
// }

// $fltr = new Fltr($foo);
// $ws = $fltr->ne(\T_WHITESPACE);

// foreach($ws as $idx => $itm) {
//     echo 'id : :' . $idx; 
//     print Stringify::fromTkn($itm) 
//     . PHP_EOL;
// }