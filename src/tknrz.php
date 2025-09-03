<?php

require_once 'src/Autoload.php';

use Koalas\Core\Kql\Tknrz;
use SchrodtSven\Koalas\Source\Php\Tknz;
foreach(range(0,11, 3) as $itm)
    echo $itm .PHP_EOL;

die;
$code = "a == b";

$tknr = new Tknrz($code);
$tknz = $tknr->getTokens();
var_dump($tknz);
echo implode("", $tknz);