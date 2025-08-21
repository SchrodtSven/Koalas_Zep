<?php
$file = 'koalas/koalas/Type/Op/Filter.zep';
//$file = 'tmp/Filter.zep';
$retval = zephir_parse_file(file_get_contents($file), $file);

var_dump($retval);