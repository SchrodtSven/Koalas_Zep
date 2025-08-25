<?php
use Koalas\Type\Str;
use Koalas\Source\Generic\Builder;
use Koalas\Source\Generic\Assignment;
use Koalas\Core\Kql\Expr;

// $items = ['Foo', "Bar", 1.23, 42000, new Str('Foo')];
// $builder = new Builder();

// var_dump($builder->getList($items, true));


// $asgn = new Assignment();

// $asgn->setLeft('Foo');
// $asgn->setRight('2 * x');

// print($asgn);

$expr = new Expr('>=');
$expr->setOperands(['2+3', '6-1']);
print($expr);

