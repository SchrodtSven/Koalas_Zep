<?php
/**
 * Zephir Tokens - extending \PhpToken
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
 * @since 2025-08-2
 */

namespace SchrodtSven\Koalas\Source\Zephir;

use OutOfBoundsException;

class ZepToken extends \PhPToken
{
    const ERR_ID_BND = "Given ID is out of boundary: %s - use int >= 1024"; 

    public function sanitize(): void
    {
        if($this->id <1024)
            throw new \OutOfBoundsException(sprintf(self::ERR_ID_BND, $this->id));
    }
}
