<?php

namespace Tests;

use PHPUnit\Framework\TestCase;
use PHPUnit\Framework\Attributes\DataProvider;
use PHPUnit\Framework\Attributes\TestWith;
use Koalas\Type\Str;
class StrTest extends TestCase
{

 
    #[TestWith(['Foo_bar', '[Foo_bar]', ']', '['])]
     #[TestWith(['Ipsum', 'LoremIpsum Foo', ' Foo', 'Lorem'])]
    public function testIfPreAndAppendWorxProperly(string $origin, string $expected, string $append, string $prepend): void
    {
        $s = new Str($origin);
        $this->assertSame((string)($s->app($append)->prep($prepend)), $expected);
    }

    #[TestWith(['var foo = 23;', 4])]
    #[TestWith(['Foo bar    nn. Gas.  Guy Baz', 6])]
    public function testIfSplitCorrectlyByWhitespace(string $origin, int $count): void
    {   
        $s = new Str($origin);
        $this->assertTrue(count($s->splitByWS()) == $count);
    }

   

    public function testFoo()
    {
        $my = new Str('Foo');
        $this->assertSame((string) $my->q(), "'Foo'");
    }
}