<?php

/**
 * Unit tests for 
 * 
 * @see https://docs.phpunit.de/en/12.3/attributes.html#dataprovider
 */

use PHPUnit\Framework\TestCase;
use Koalas\Type\Str;
use PHPUnit\Framework\Attributes\TestWith;
use PHPUnit\Framework\Attributes\DataProvider;
use Koalas\Type\Binary\Bit;
use Koalas\Type\Binary\Bits;
class BitsTest extends TestCase
{
     public function testBasix()
    {
        $fullByte= new Bits(255, 8);

        $this->assertSame($fullByte->getCurrentValue(), 255);
        $this->assertSame((string) $fullByte, '11111111');

        $zero = new Bits(0, 8);
        $this->assertSame((string) $zero, '00000000');
        $this->assertSame($zero->getCurrentValue(), 0);

        $kilo = new Bits(1024, 11);
        $this->assertSame((string) $kilo, '10000000000');
        $this->assertSame($kilo->getCurrentValue(), 1024);

        

    }
}
