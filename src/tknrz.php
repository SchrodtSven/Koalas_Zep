<?php

require_once 'src/Autoload.php';

use Koalas\Core\Kql\Tknrz;
use SchrodtSven\Koalas\Source\Php\Tknz;

$code = "a == b";

$tknr = new Tknrz($code);
$tknz = $tknr->getTokens();
var_dump($tknz);
echo implode("", $tknz);