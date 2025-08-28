<?php

/**
 * Parser for PHP source code
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
 * @since 2025-08-28
 */

namespace SchrodtSven\Koalas\Source\Php;

use Koalas\Core\Kql\Tknrz;
use Koalas\Source\Php\TknLst;
use PhpToken;
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
     * Sanitizing PHP var names ($@[0]) to a generic form of variable name
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
                $tmp[] = $this->lst[$i];
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

    public function prepend($idx, mixed $val): self
    {
        $this->lst->insert($idx, $val);
        return $this;
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

$parser = new Prsr(file_get_contents('gen_tst_prse.php'));
$parser->sanitzeVars();
$tknz = $parser->filter([
    T_OPEN_TAG,
    T_CLOSE_TAG, 
    //\T_WHITESPACE
]);

foreach ($tknz as $id=> $tkn) {
    printf(
        "[%d]: %s - %s %s",
        $id,
        $tkn->getTokenName(),
        implode(' : ', get_object_vars($tkn)),
        PHP_EOL

    );
}



$os = $parser->findNext('{');

$last = $parser->find(\T_VAR, $os); // 

var_dump($parser->findBetween(61, 17, $last));
$let = new PhpToken(1025, 'let');
$tknz23 = $parser->prepend($os +2, $let)->filter([T_OPEN_TAG]);

// var_dump($parser->getLst());
echo implode(' ', $tknz23);

foreach($tknz23 as $itm) {
    if ($itm->id == \T_WHITESPACE) {
        echo "'{$itm->text}'" . PHP_EOL;
    }
}




exit();
// prepend($os -1, ' ')->





// $lst = $parser->getLst();
// $lst->insert(0, 'FooBar');
// foreach($lst as $idx => $itm) {
//     echo $idx, PHP_EOL;
//     var_dump($itm);
// }

//var_dump($lst);