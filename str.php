<?php
use Koalas\Type\Str;

$t = new Str('Foo');

$t->prep('FFF');

print($t);
