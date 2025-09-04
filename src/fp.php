<?php
use Koalas\Stream\File\LnParser;


$fn = 'doq/dd.txt';

$prsr = new LnParser($fn);
$prsr->parse();
var_dump($prsr->getPrePrse());