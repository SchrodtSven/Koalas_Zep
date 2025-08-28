<?php
foreach(get_defined_constants() as $idx => $val) {
    if(str_starts_with($idx, 'T_'))
        printf('"%s" => %d, %s',
               $idx,
               $val,
               PHP_EOL     
    );
}