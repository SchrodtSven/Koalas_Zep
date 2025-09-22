<?php

/**
 * Parser for PHP source code
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.3
 * @since 2025-08-28
 */

namespace SchrodtSven\Koalas\Source\Php;

use Koalas\Core\Kql\Tknrz;
use SchrodtSven\Koalas\Source\Php\TknLst;
use PhpToken;
use PHPUnit\Event\Code\Phpt;
use stdClass;

class Prsr
{
    private TknLst  $lst;

    private TknLst  $prsd;

    public function __construct(private string $code)
    {
        $this->lst = new TknLst(\PhpToken::tokenize($code));
        $this->prsd = new TknLst();
    }

    public function consume()
    {}

    public function peek(int $idx) : \PhpToken
    {
        return $this->lst[$idx];
    }

    public function poke(int $idx, \PhpToken $val): self
    {
        $this->lst[$idx] = $val;
        return $this;
    }

    public function prep($idx, mixed $val): self
    {
        $this->lst->prepend($idx, $val);
        return $this;
    }

    public function unset(int $idx) : self
    {
        unset($this->lst[$idx]);
        return $this;
    }

    /**
     * Get the value of lst
     *
     * @return TknLst
     */
    public function getLst(): TknLst
    {
        return $this->lst;
    }

    /**
     * Set the value of lst
     *
     * @param TknLst $lst
     *
     * @return self
     */
    public function setLst(TknLst $lst): self
    {
        $this->lst = $lst;

        return $this;
    }

    /**
     * Sanitizing PHP var names (@[0]=='$') to a generic form of variable name
     *
     * @return void
     */
    public function sanitzeVars(): self
    {
        for ($i = 0; $i < count($this->lst); $i++) {
            if ($this->lst[$i]->id  == \T_VARIABLE) {
                $this->lst[$i]->text = substr($this->lst[$i]->text, 1);
            }
        }
        return $this;
    }


    public function filter(array $criteria = [\T_WHITESPACE]): array
    {
        $tmp = [];
        for ($i = 0; $i < count($this->lst); $i++) {
            if (!in_array($this->lst[$i]->id, $criteria)) {
                $tmp[$i] = $this->lst[$i];
            }
        }
        return $tmp;
    }

    public function findNext(int|string $tknId, int $offset=0)
    {
        for ($i = $offset; $i < count($this->lst); $i++) {
            if ($this->lst[$i]->id == $tknId || $this->lst[$i]->text == $tknId) {
                return $i;
            }
        }
        return -1;
    }

    public function find(int|string $tknId, int $offset)
    {
        for ($i = $offset; $i < count($this->lst); $i++) {
            if ($this->lst[$i]->id == $tknId || $this->lst[$i]->text == $tknId) {
                return $i;
            }
        }
        return -1;
    }

    

    public function findBetween(int|string $tknId, int $offset, int $last)
    {
        for ($i = $offset; $i < $last; $i++) {
            if ($this->lst[$i]->id == $tknId || $this->lst[$i]->text == $tknId) {
                return $i;
            }
        }
        return -1;
    }

    

    /**
     * Preparse PHP token list for usage in Zephir
     *
     * @return self
     */
    public function zephirize(): self
    {
        for ($i = 0; $i < count($this->lst); ++$i) {
        }
        return $this;
    }
}

