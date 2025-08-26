<?php

namespace Tests;

use PHPUnit\Framework\TestCase;
use PHPUnit\Framework\Attributes\DataProvider;
use PHPUnit\Framework\Attributes\TestWith;
use PHPUnit\Framework\Attributes\Depends;
use Koalas\Type\Arr;

class ArrTest extends TestCase
{

    const string FOO = "foo";
    const int Q42 = 2 * 21;

    const string BAR = "bar";
    const float BAZ = 33.3;

    protected $stack;

    public function setUp(): void
    {
        $this->stack = Arr::fromJson('mock_detail.json');
    }

    public function testDataSanity()
    {
        $this->assertTrue(count($this->stack) == 1000);
    }

    public function testIfExceptionIsThrownOnFileNotExists()
    {
        $this->expectException(\Exception::class);
        $this->stack = Arr::fromJson('m0rc.jason');
    }


    #[TestWith([5, 8])]
    #[TestWith([15, 88])]
    #[TestWith([5, 388])]
    public function testIfSlicingWorxProperly(int $offS, int $len = 8)
    {

        //$lIdx = $len + $offS;
        $slc = $this->stack->slice($offS, $len);
        $this->assertSame(array_key_first($slc), 0);
        $this->assertSame(array_key_last($slc), count($slc) - 1);
    }


    public function testEmpty(): Arr
    {
        $stack = new Arr();
        $this->assertTrue(count($stack) == 0);

        return $stack;
    }

    #[Depends('testEmpty')]
    public function testPush(Arr $stack): Arr
    {

        $stack->push(self::FOO);
        $this->assertSame('foo', $stack[count($stack) - 1]);
        $this->assertNotEmpty($stack);

        return $stack;
    }

    #[Depends('testPush')]
    public function testPop(Arr $stack): Arr
    {
        $this->assertSame(self::FOO, $stack->pop());
        $this->assertEmpty($stack);

        $stack->push(self::Q42);
        return $stack;
    }

    #[Depends('testPop')]
    public function testUnshift(Arr $stack): Arr
    {
        $stack->unshift(self::FOO);
        $this->assertTrue(count($stack) == 2);
        return $stack;
    }


    #[Depends('testUnshift')]
    public function testShift(Arr $stack): void
    {
        $this->assertSame($stack->shift(), self::FOO);
        $this->assertSame($stack->shift(), self::Q42);
        $this->assertEmpty($stack);
    }


    public static function ArrayProvider(): array
    {
        return [
            [[99, 77, 23, 'Foo'], 3, 0],
            [['Foo' => 42, 'di' => 'IoC', 99 => 2.4], 99, 'Foo']

        ];
    }

      #[DataProvider('ArrayProvider')]
    public function testFirstLastKeys(array $origin, $l, $f): void
    {
        $lst = new Arr($origin);
        $this->assertSame($l, $lst->lastKey());
        $this->assertSame($f, $lst->firstKey());
        
        $lst->unshift( self::BAZ);
        $lst->push(self::BAR);

        $this->assertSame(self::BAR, $lst[$lst->lastKey()]);
        $this->assertSame(self::BAZ, $lst[$lst->firstKey()]);

    }
}
