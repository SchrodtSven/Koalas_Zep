<?php

use FFI\Exception;
use Koalas\Type\Str;
use Koalas\Source\Generic\Builder;
use Koalas\Source\Generic\Assignment;
use Koalas\Core\Kql\Expr;
use Koalas\Core\Kql\ExprType\Eq;
use Koalas\Core\Kql\ExprType\Ne;
use Koalas\Core\Kql\ExprType\Gt;
use Koalas\Core\Kql\ExprType\Ge;
use Koalas\Core\Kql\ExprType\Ids;
use Koalas\Core\Kql\ExprType\Lt;
use Koalas\Core\Kql\ExprType\Le;
// $items = ['Foo', "Bar", 1.23, 42000, new Str('Foo')];
// $builder = new Builder();

// var_dump($builder->getList($items, true));


// $asgn = new Assignment();

// $asgn->setLeft('Foo');
// $asgn->setRight('2 * x');

// print($asgn);

// $expr = new Expr('>=');
// $expr->setOperands(['2+3', '6-1']);
// print($expr);

// var_dump([ne::OP, Ne::OP_NM]);


// $foo = new Ne(['Foo', 'Bar']);
// var_dump($foo);

// exit(666);



$expr = [
   [ Eq::class, 'EQ', 'BINARY'],
    // [Ne::class, 'NE', 'BINARY'],
    // [Ids::class, 'IDS', 'BINARY'],
    // [Gt::class, 'GT', 'BINARY'], 
    // [Ge::class, 'LT', 'BINARY'],
    // [Lt::class, 'LT', 'BINARY'],
    // [Le::class, 'LE', 'BINARY']

];

foreach($expr as $cn) {
    
    $my = new $cn[0](['Foo', 'Bar']);
   var_dump($my->getOperands());
}
