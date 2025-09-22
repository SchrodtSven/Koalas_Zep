<?php

declare(strict_types=1);
/**
 * List of PHP Tokens as <SplDoublyLinkedList> but extending SPLDLL with
 * 
 * - methods with type hints
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.3
 * @since 2025-08-28
 */

namespace SchrodtSven\Koalas\Source\Php;


class TknLst extends \SplDoublyLinkedList
{
    public function __construct(array $dta = [])
    {
        for ($i = 0; $i < count($dta); $i++) {
            $this->append($dta[$i]);
        }
    }

    /**
     * Wrapper for self::add() with type hint
     *
     * @param \PhpToken $token
     * @return void
     */
    public function append(\PhpToken $token)
    {
        $this->push($token);
    }

    /**
     * Wrapper for self::add() with type hint
     *
     * @param \PhpToken $token
     * @return void
     */

    public function prepend(int $idx, \PhpToken $token)
    {
        $this->add($idx, $token);
    }

    public function __toString(): string
    {
        $tmp = '';
        $idx = 0;
        for ($this->rewind(); $this->valid(); $this->next()) {
            $val = $this->current();
            $ln = implode(' : ', get_object_vars($val));
            $cls = $val::class;
            //if ($val->id != \T_WHITESPACE)
            $tmp .=  "{$idx}: {$ln} {$val->getTokenName()} - {$cls}\n";
            $idx ++;
        }
        return $tmp;
    }
}

// $code = file_get_contents('gen_tst_prse.php');
// $lst = new TknLst(\PhpToken::tokenize($code));
// $lst->append(new \PhpToken(1025, 'let'));
// var_dump($lst);