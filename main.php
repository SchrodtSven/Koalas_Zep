<?php
use Koalas\Core\Kql\Entity\Num;

$lst =  [

            [2.33, 'float', 2.33],
            [false, 'NULL', NULL],
            [0x666, 'integer', 1638],
            [22, 'integer', 22],
            [null, 'integer', 0],
            [0, 'integer', 0],
            ['3.14', 'float', 3.14],
            ["222", 'integer', 222]
        ];


for($i=0;$i<count($lst);$i++) {
    $ins = new Num($lst[$i][0]);
    var_dump ($ins);
}