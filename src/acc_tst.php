<?php

use Koalas\Core\Intl\IdxSlc;

$foo = new IdxSlc();
$foo["12:23"] = "HAllo!";
echo PHP_EOL .str_repeat('___', 23) . PHP_EOL;
var_dump($foo);