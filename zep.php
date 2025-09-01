#!/usr/bin/env php
<?php
require_once 't00lz/color.php';
require_once 't00lz/ze_parse.php';



//$file = 'koalas/koalas/Core/Kql/Entity/Lst.zep';
//$file = 'koalas/koalas/Core/Kql/Entity/Lst.zep';
// $file =  'koalas/koalas/Source/Zephir/ZepToken.zep';
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
    'koalas/koalas/Source/Php/Syntax.zep',
    'koalas/koalas/Source/Zephir/ZepTkn.zep',
    'koalas/koalas/Source/Php/Prsr.zep',
    'koalas/koalas/Source/Php/TknLst.zep',
    'koalas/koalas/Source/Php/Fltr.zep',
    'koalas/koalas/Stream/File/LnParser.zep',
    'koalas/koalas/Type/Arr.zep',
    'koalas/koalas/Type/Binary/Bit.zep',
    'koalas/koalas/Type/Binary/Bits.zep',
    //'koalas/koalas/Type/Binary/Byte.zep',
    'koalas/koalas/Source/Php/TknLst.zep',
    'koalas/koalas/Type/Op/Filter.zep',
    'koalas/koalas/Type/Op/Numberizr.zep',
    'koalas/koalas/Type/Str.zep',
    'koalas/koalas/Source/Generic/Stringify.zep',
    'koalas/koalas/Source/Php/Prsr.zep'
];

$parser = new PreParser($file);
$parser->setStopOnError(true);
print $parser->getErrors() . " errors found!" . PHP_EOL;
print $parser->count() . " files pre parsed" . PHP_EOL;