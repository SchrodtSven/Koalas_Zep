<?php
use Koalas\Type\Arr;

$stack = Arr::fromJson('mock_detail.json');

$stack->walk(fn(&$itm) => $itm['full'] = $itm['first_name'] . ' ' . $itm['last_name']);
$slc = $stack->rows(3, 2);
print_r($stack->cols('full'));