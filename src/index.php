<?php

require_once 'src/Autoload.php';

use Koalas\Source\Php\TknLst;
use Koalas\Source\Generic\Stringify;
use Koalas\Source\Php\Prsr;

$parser = new Prsr(file_get_contents('gen_tst_prse.php'));

var_dump($parser);