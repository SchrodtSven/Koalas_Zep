<?php
use Koalas\Core\Kql\Parser;
use Koalas\Core\Kql\Tknrz;
use Koalas\Type\Arr;
use Koalas\Stream\File\LnParser;

use Koalas\Type\Binary\Bit;
use Koalas\Type\Binary\Bits;


$kilo = new Bits(1024);

printf('%032b', 1025);

var_dump($kilo);