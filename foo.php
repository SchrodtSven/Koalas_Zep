<?php
use Koalas\Type\Str;
use Koalas\Source\Generic\Builder;

$items = ['Foo', "Bar", 1.23, 42000, new Str('Foo')];
$builder = new Builder();

var_dump($builder->getList($items, true));


