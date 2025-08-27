#!/usr/bin/env php
<?php
require_once 't00lz/color.php';
require_once 't00lz/ze_parse.php';
// $file = 'koalas/koalas/Source/Generic/Builder.zep';
// $parser = new PreParser($file);
// exit();

$file = [
    'koalas/koalas/Core/Dataframe.zep',
    'koalas/koalas/Core/Kql/Ast.zep',
    'koalas/koalas/Core/Kql/Entity/Lst.zep',
    'koalas/koalas/Core/Kql/Entity/Num.zep',
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
    'koalas/koalas/Core/Kql/ParseHelper.zep',
    'koalas/koalas/Core/Kql/Parser.zep',
    'koalas/koalas/Core/Kql/Tknrz.zep',
    'koalas/koalas/Core/Kql/Tokens.zep',
    'koalas/koalas/Source/Generic/Assignment.zep',
    'koalas/koalas/Source/Generic/Builder.zep',
    'koalas/koalas/Source/Generic/Grammar.zep',
    'koalas/koalas/Stream/File/LnParser.zep',
    'koalas/koalas/Type/Arr.zep',
    'koalas/koalas/Type/Binary/Bit.zep',
    'koalas/koalas/Type/Binary/Bits.zep',
    //'koalas/koalas/Type/Binary/Byte.zep',
    
    'koalas/koalas/Type/Op/Filter.zep',
    'koalas/koalas/Type/Op/Numberizr.zep',
    'koalas/koalas/Type/Str.zep'
];

$parser = new PreParser($file);