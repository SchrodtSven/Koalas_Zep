<?php

namespace Tests;

use PHPUnit\Framework\TestCase;
use PHPUnit\Framework\Attributes\DataProvider;
use PHPUnit\Framework\Attributes\TestWith;
use Koalas\Source\Generic\Builder;
use Koalas\Type\Arr;

class BuilderTest extends TestCase
{

 
     #[TestWith(['Ipsum', '"Ipsum"'])]
     #[TestWith([23, '23'])]
       public function testContextualize(mixed $given, mixed $expected)
    {
        $my = new Builder();
        $this->assertSame($my->ctxVal($given), $expected);
    }

        
    
     #[TestWith([["Foo", "Bar", 1.23, 42000, 'Foo'], '"Foo", "Bar", 1.23, 42000, "Foo"'])]
     
    public function testListing(array $dta, string $expected)
    {
        $my = new Builder();
        $this->assertSame($my->getList($dta, true), $expected);

        //$arr = new Arr($dta);
        //$this->assertSame($arr->join(', '), $expected);
    }
}