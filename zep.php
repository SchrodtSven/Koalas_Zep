<?php

//$file = 'koalas/koalas/Source/Generic/Builder.zep';
//$file = 'koalas/koalas/Type/Op/Numberizr.zep';
//$file = 'koalas/koalas/Core/Kql/Entity/Num.zep';
//$file = 'koalas/koalas/Core/Kql/Parser.zep';
//$file = 'koalas/koalas/Core/Kql/Entity/Lst.zep';
//$file = 'koalas/koalas/Core/Kql/ParseHelper.zep';
//$file = 'koalas/koalas/Core/Kql/Tknrz.zep';
//$file = 'koalas/koalas/Type/Arr.zep';
//$file = 'koalas/koalas/Stream/File/LnParser.zep';
//$file = 'koalas/koalas/Type/Op/Filter.zep';
//$file = 'koalas/koalas/Type/Str.zep';




//$file = 'koalas/koalas/Type/Binary/Bit.zep';
$file = 'koalas/koalas/Type/Binary/Bits.zep';
// $file = 'koalas/koalas/Type/Binary/Byte.zep';
// $file = 'koalas/koalas/Type/Binary/Crumb.zep';
// $file = 'koalas/koalas/Type/Binary/Nibble.zep';
// $file = 'koalas/koalas/Type/Binary/Word16.zep';
// $file = 'koalas/koalas/Type/Binary/Word16.zep';
// $file = 'koalas/koalas/Dry/SortClj.zep';

$retval = zephir_parse_file(file_get_contents($file), $file);

var_dump($retval);

exit();
//str_starts_with()
//str_contains('packeRx', 'x');

$files = [
    'koalas/koalas/Core/Kql/Entity/Lst.zep',
    'koalas/koalas/Core/Kql/Entity/Num.zep',
    'koalas/koalas/Core/Kql/Expr.zep',
    'koalas/koalas/Core/Kql/Tknrz.zep',
    'koalas/koalas/Stream/File/LnParser.zep',
    'koalas/koalas/Core/Dataframe.zep',
    'koalas/koalas/Core/Kql/Ast.zep',
    'koalas/koalas/Core/Kql/Expr.zep',
    'koalas/koalas/Core/Kql/ExprType/Eq.zep',
    'koalas/koalas/Core/Kql/ExprType/Ge.zep',
    'koalas/koalas/Core/Kql/ExprType/Gt.zep',
    'koalas/koalas/Core/Kql/ExprType/Ids.zep',
    'koalas/koalas/Core/Kql/ExprType/Inv.zep',
    'koalas/koalas/Core/Kql/ExprType/Le.zep',
    'koalas/koalas/Core/Kql/ExprType/Lt.zep',
    'koalas/koalas/Core/Kql/ExprType/Ne.zep',
    'koalas/koalas/Core/Kql/Grammar.zep',
    'koalas/koalas/Core/Kql/Parser.zep',
    'koalas/koalas/Core/Kql/Tknrz.zep',
    'koalas/koalas/Core/Kql/Tokens.zep',
    'koalas/koalas/Source/Generic/Assignment.zep',
    'koalas/koalas/Source/Generic/Builder.zep',
    'koalas/koalas/Source/Generic/Grammar.zep',
    'koalas/koalas/Type/Arr.zep',
    'koalas/koalas/Type/Op/Filter.zep',
    'koalas/koalas/Type/Str.zep'

];
foreach ($files as $file) {
    $retval = zephir_parse_file(file_get_contents($file), $file);

    var_dump($retval);
    echo '|__>|' . PHP_EOL;
    $in = fread(STDIN,1000);
}
