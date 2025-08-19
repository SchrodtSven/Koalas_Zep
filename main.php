<?php

use Koalas\Type\Str;
use Koalas\Core\Dataframe;

// $my = new Str('Foo');

// echo $my->q();

try {
    $df = new Dataframe([
        "calories" => [420, 380, 390, 666],
    "duration" => [50, 40, 45, 23],
    "name" => ['Fred', 'Sarah', 'Frauke', 'Sven']
    ]);
} catch (\Exception $e) {
    echo $e->getMessage();
}

var_dump($df->getDta()); 