<?php

namespace Tests;

use PHPUnit\Framework\TestCase;
use PHPUnit\Framework\Attributes\DataProvider;
use Koalas\Core\Kql\Entity\Num;

class NumTest extends TestCase
{


    public static function setUpBeforeClass(): void {}

    public static function tearDownAfterClass(): void {}


    #[DataProvider('numericExpressionProvider')]
    public function testNumCasting($orig, $type, $val)
    {
        $foo = new Num($orig);
        $this->assertSame($foo->getType(), $type);
        $this->assertSame($foo->getVal(), $val);
    }

    public static function numericExpressionProvider(): array
    {
        return [

            [2.33, 'float', 2.33],
            [false, 'NULL', NULL],
            [0o666, 'integer', 438],
            [22, 'integer', 22],
            [null, 'NULL', NULL],
            [0, 'integer', 0],
            [0x666, 'integer', 1638],
            ['3.14', 'float', 3.14],
            ["222", 'integer', 222]
        ];
    }
}
