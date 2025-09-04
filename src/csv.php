<?php

use Koalas\Stream\File\CsvManager;
use Koalas\Type\Dataframe;

$fnm = 'dta/de.csv';

$df = new Dataframe();
$df->readCsv($fnm);

// var_dump($df->getDta());

                    // dta/worldcities.csv
//$man = new CsvManager($fnm);
print_r($df->columns());
var_dump($df->iloc['0:5']);