<?php

namespace Tests;

use PHPUnit\Framework\TestCase;
use PHPUnit\Framework\Attributes\DataProvider;
use Koalas\Type\Str;
class BasixTest extends TestCase
{

 
    public static function setUpBeforeClass(): void
    {
       
    }

    public static function tearDownAfterClass(): void
    {
        
    }

   

    public function testFoo()
    {
        $my = new Str('Foo');
        $this->assertSame((string) $my->q(), "'Foo'");
    }
}