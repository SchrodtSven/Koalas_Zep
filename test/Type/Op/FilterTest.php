<?php

namespace Tests;

use PHPUnit\Framework\TestCase;
use PHPUnit\Framework\Attributes\DataProvider;
use Koalas\Type\Op\Filter;
class FilterTest extends TestCase
{
    protected array $lst;
    protected Filter $filter;
 
    public function setUp(): void
    {   
        $this->lst = json_decode(file_get_contents('mock_detail.json'), true);
        $this->filter  = new Filter($this->lst);
    }

    public function testFilterBasix(): void
    {
        
        $this->assertInstanceOf(Filter::class, $this->filter);
    }

    public function testIfUniqWorxProperly(): void
    {

        $countries = ['France', 'Japan', 'Germany', 'United Kingdom'];

        $uniq = $this->filter->uniq('country');

        $this->assertSame(count($countries), count($uniq));
        foreach ($uniq as $itm) {
            $this->assertTrue(in_array($itm, $countries));
        }
    }

    public function testIfBetweenWorxProperly(): void
    {
        $ids = $this->filter->withCrit('id')->between(991, 989);
        $this->assertSame(3, count($ids->getDta()));
        
        $this->filter->reset();
        // some random sclices
        $min = mt_rand(0, 500);
        $max = mt_rand($min+5, 1000);
        $newIds = array_column($this->filter->withCrit('id')
                                    ->between($min, $max)
                                ->getDta(), 'id');
                                    
        // iterate through slices from original data completly
        for ($i = 0; $i < count($newIds); $i++) {
                $curr = $newIds[$i];
                
                $this->assertTrue($curr >= $min && $curr <=$max);
            }
    }

    public function testIfContainsWorxProperly(): void
    {

        $genre = ['Crime', 'Romance', 'Drama', 'Adventure', 'Comedy', 'Fantasy', 'Musical'];
        foreach ($genre as $look4) {
            $this->filter->reset();
            $curr = array_column($this->filter->withCrit('mvie_gnr')->contains($look4)->getDta(), 'mvie_gnr');
            for ($i = 0; $i < count($curr); $i++) {
                $this->assertTrue(str_contains($curr[$i], $look4));
            }
        }
    }

    public function testReset(): void
    {
        $this->filter->reset();
        $this->assertTrue(count($this->filter->getDta()) == 1000);
        $this->filter->withCrit('gender')->eq('Female')->getDta();
        $this->assertTrue(count($this->filter->getDta()) < 1000);
        $this->filter->reset();
        $this->assertTrue(count($this->filter->getDta()) == 1000);
    }

    public function testAggregates(): void
    {
        $this->filter->reset();
        $this->assertTrue(str_starts_with($this->filter->min('member_since'), '1923'));
        $this->assertTrue(str_starts_with($this->filter->max('member_since'), '2025'));
    }

   

}