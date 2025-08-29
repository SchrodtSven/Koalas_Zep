<?php

require_once 'src/Autoload.php';

use Koalas\Source\Php\TknLst;
use Koalas\Source\Generic\Stringify;

$lst = new TknLst(
    \PhpToken::tokenize(file_get_contents('gen_tst_prse.php'))
);

//echo Stringify::fromTkn($lst[9]);

echo $lst;