<?php
declare(strict_types=1);
/**
 * List of PHP Tokens as <SplDoublyLinkedList>
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
 * @since 2025-08-28
 */
namespace SchrodtSven\Koalas\Source\Php;


class TknLst extends \SplDoublyLinkedList
{
    public function __construct(array $dta = [])
    {
        for($i=0;$i<count($dta);$i++) {
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
}

$code = file_get_contents('gen_tst_prse.php');
$lst = new TknLst(\PhpToken::tokenize($code));
$lst->append(new \PhpToken(1025, 'let'));
var_dump($lst);