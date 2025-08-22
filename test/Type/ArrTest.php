<?php

namespace Tests;

use PHPUnit\Framework\TestCase;
use PHPUnit\Framework\Attributes\DataProvider;
use PHPUnit\Framework\Attributes\TestWith;
use Koalas\Type\Arr;

class ArrTest extends TestCase
{
    protected Arr $stack;

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


    #[TestWith([5,8])]
    #[TestWith([15,88])]
    #[TestWith([5,388])]
    public function testIfSlicingWorxProperly(int $offS,int $len = 8)
    {
        
        //$lIdx = $len + $offS;
        $slc = $this->stack->slice($offS, $len);
        $this->assertSame(array_key_first($slc), 0);
        $this->assertSame(array_key_last($slc), count($slc)-1);
    }
}
