<?php

class Foo
{
    protected string $bar = "23";
    public int $no = 23;
    private bool $baz = true;

    public function foo(): int
    {
        return $this->no;
    }
}
