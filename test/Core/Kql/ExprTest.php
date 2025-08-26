<?php

namespace Tests;

use PHPUnit\Framework\TestCase;
use PHPUnit\Framework\Attributes\DataProvider;
use Koalas\Type\Str;
use Koalas\Core\Kql\ExprType\Eq;
use Koalas\Core\Kql\ExprType\Ne;
use Koalas\Core\Kql\ExprType\Gt;
use Koalas\Core\Kql\ExprType\Ge;
use Koalas\Core\Kql\ExprType\Ids;
use Koalas\Core\Kql\ExprType\Lt;
use Koalas\Core\Kql\ExprType\Le;
use Koalas\Core\Kql\ExprType\Inv;

class ExprTest extends TestCase
{


    public static function setUpBeforeClass(): void {}

    public static function tearDownAfterClass(): void {}

     #[DataProvider('expressionProvider')]
    public function testAllTypes(string $cn, string $nm, string $type)
    {
        if($cn != Inv::class) {
            $my = new $cn(['Foo', 'Bar']);    
        } else {
            $my = new $cn(['Foo']);
        }
        
        $this->assertSame((string) $my->getType(), $type);
        $this->assertSame((string) $my->getName(), $nm);
        $ops = $my->getOperands();
        $this->assertSame((string) $ops[0], 'Foo');
        if($my->getType() ==  'BINARY' ) {
            $this->assertSame((string) $ops[1], 'Bar');
        }
        
    }

    public static function expressionProvider(): array
    {
        return [
            [Eq::class, 'EQ', 'BINARY'],
            [Ne::class, 'NE', 'BINARY'],
            [Ids::class, 'IDS', 'BINARY'],
            [Gt::class, 'GT', 'BINARY'],
            [Ge::class, 'GE', 'BINARY'],
            [Lt::class, 'LT', 'BINARY'],
            [Le::class, 'LE', 'BINARY'],
            [Inv::class, 'INV(NOT)', 'PREFIX'],

        ];
    }
}
