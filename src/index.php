<?php
use Koalas\Stream\File\LnParser;

require_once 'src/Autoload.php';

$tpl = file_get_contents('koalas/koalas/Source/Zephir/TPl/filter_expr.tpl');

$parser = new LnParser('koalas/koalas/Source/Zephir/Tpl/op.txt');
$lns  = $parser->parse();
//var_dump($tpl);
//exit(23);



foreach($lns as $row) {
  list($nm, $op, $cm) = $row;
  //print_r([$nm, $op, $cm]);
  print(str_replace(
    ['{{FN}}', '{{OP}}', '{{CM}}'],
    [strtolower($nm), $op, $cm],
    $tpl
    )
  );
  echo PHP_EOL, PHP_EOL;
}