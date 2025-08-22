<?php
// $file = 'koalas/koalas/Type/Op/Filter.zep';
// $file = 'koalas/koalas/Type/Str.zep';
//$file = 'koalas/koalas/Core/Kql/Tknrz.zep';
//$file = 'koalas/koalas/Core/Kql/Parser.zep';
//$file = 'tmp/Filter.zep';


$file = 'koalas/koalas/Core/Kql/Ast.zep';

$retval = zephir_parse_file(file_get_contents($file), $file);

var_dump($retval);