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

class Prsr
{
    private TknLst  $lst;

    public function __construct(private string $code)
    {
        $this->lst = new TknLst(\PhpToken::tokenize($code));
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


    public function find(int $offset, int $tknId)
    {
        for ($i = 0; $i < count($this->lst); $i++) {
            if ($this->lst[$i]->id == $tknId) {
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
        for ($i = 0; $i < count($this->lst); $i++) {
        }
        return $this;
    }
}

$parser = new Prsr(file_get_contents('gen_tst_prse.php'));
$parser->sanitzeVars();
$tknz = $parser->filter([\T_WHITESPACE, T_OPEN_TAG, T_CLOSE_TAG]);

foreach ($tknz as $tkn) {
    printf(
        "%s - %s %s",
        $tkn->getTokenName(),
        implode(' : ', get_object_vars($tkn)),
        PHP_EOL

    );
}

echo implode(' ', $tknz);
