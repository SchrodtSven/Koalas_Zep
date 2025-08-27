#!/usr/bin/env php
<?php
/***
 * Generates matrix like random numbers as binary literals
 * in an endless loop printing to <STDIN>
 * 
 * @since 2025-08-27
 * @author Sven Schrodt<sven@schrodt.nrw>
 */

$binaryLen = 32; // by default 32 bits wide

$frmt = "%0{$binaryLen}b%s"; // format string for printf

$r = new \Random\Randomizer();
for(;;) {
    $i = $r->getInt(0, pow(2, $binaryLen));
    printf($frmt, $i, PHP_EOL);

}
    
