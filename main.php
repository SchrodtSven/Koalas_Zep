<?php

use Koalas\Type\Str;
use Koalas\Type\Arr;

$foo = new Arr(['Werner', ['Herbert', 'Kuh'], 'Franzy', 'Herbie', 'Walter', 'Warren']);

var_dump($foo->slice(1, 3));