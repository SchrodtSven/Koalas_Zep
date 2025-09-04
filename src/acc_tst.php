<?php

use Koalas\Core\Intl\IdxSlc;

$foo = new IdxSlc();
$acc = "::2";
$foo[$acc] = "Hallo!";
echo $foo;
echo PHP_EOL . str_repeat('___', 23) . PHP_EOL;
var_dump($foo->getMta());
