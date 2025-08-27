<?php
use Koalas\Core\Kql\Parser;
use Koalas\Core\Kql\Tknrz;
use Koalas\Type\Arr;
use Koalas\Stream\File\LnParser;

$dta = (new LnParser('doq/dd.txt'))->parse();
var_dump($dta);
exit();
uasort($dta, function($a, $b) {
    if ($a == $b) {
        return 0;
    }
    return ($a < $b) ? -1 : 1;
});

var_dump($dta);
