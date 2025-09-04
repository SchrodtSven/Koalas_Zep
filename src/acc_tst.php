<?php

use Koalas\Core\Intl\IdxSlc;

$foo = new IdxSlc();
$acc = [3,4,5];
$foo[$acc] = "HAllo!";
//echo $acc;
echo PHP_EOL .str_repeat('___', 23) . PHP_EOL;
var_dump($foo);