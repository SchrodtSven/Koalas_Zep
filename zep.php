<?php

//$file = 'koalas/koalas/Source/Generic/Builder.zep';
$file = 'koalas/koalas/Type/Op/Numberizr.zep';
//$file = 'koalas/koalas/Core/Kql/Entity/Num.zep';

$retval = zephir_parse_file(file_get_contents($file), $file);

var_dump($retval);

exit();

$files = [
    'koalas/koalas/Type/Op/Filter.zep',
    'koalas/koalas/Core/Dataframe.zep',
    'koalas/koalas/Core/Kql/Tokens.zep',
    'koalas/koalas/Core/Kql/Parser.zep',
    'koalas/koalas/Core/Kql/Ast.zep',
    'koalas/koalas/Core/Kql/Tknrz.zep',
    'koalas/koalas/Core/Kql/Parser.zep',
    'koalas/koalas/Core/Kql/Grammar.zep',
    'koalas/koalas/Type/Arr.zep',
    'koalas/koalas/Type/Str.zep',
    'koalas/koalas/Type/Arr.zep',
    'koalas/koalas/Type/Op/Filter.zep',
    'koalas/koalas/Source/Generic/Assignment.zep',
    'koalas/koalas/Source/Generic/Grammar.zep',
    'koalas/koalas/Source/Generic/Builder.zep',
    //'koalas/koalas/Math/Mtx.zep',
    'koalas/koalas/Core/Kql/Expr.zep',
    

];

$files_two = [
    'koalas/koalas/Core/Kql/ExprType/Gt.zep',
    'koalas/koalas/Core/Kql/ExprType/Lt.zep',
    'koalas/koalas/Core/Kql/ExprType/Ge.zep',
    'koalas/koalas/Core/Kql/ExprType/Le.zep',
    'koalas/koalas/Core/Kql/ExprType/Eq.zep',
    'koalas/koalas/Core/Kql/ExprType/Ne.zep',
    'koalas/koalas/Core/Kql/ExprType/Ids.zep',
    'koalas/koalas/Core/Kql/ExprType/Inv.zep'
];
$files_new = [
     'koalas/koalas/Core/Kql/Expr.zep',
     'koalas/koalas/Core/Kql/Tknrz.zep'
      
];
foreach ($files_new as $file) {
    $retval = zephir_parse_file(file_get_contents($file), $file);

    var_dump($retval);
}
