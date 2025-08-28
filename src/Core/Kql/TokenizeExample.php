<?php

declare(strict_types=1);
/**
 * Testing tokenizer for Koalas\Core\Kql
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package PhpLab
 * @version 0.0.2
 * @since 2025-08-28
 */

namespace SchrodtSven\Koalas;
use Koalas\Core\Kql\Tknrz;

class TokenizeExample
{
    protected array $tokens;

    protected array $tknr;
    
    public function __construct(string $code)
    {
        $this->tokens = Tknrz::natTokenize($code);
        
    }

    /**
     * Get the value of tokens
     *
     * @return array
     */
    public function getTokens(): array
    {
        return $this->tokens;
    }

    /**
     * Set the value of tokens
     *
     * @param array $tokens
     *
     * @return self
     */
    public function setTokens(array $tokens): self
    {
        $this->tokens = $tokens;

        return $this;
    }

    /**
     * Sanitizing PHP var names ($@[0]) to a generic form of variable name
     *
     * @return void
     */
    public function sanitzeVars(): self
    {
        for($i=0;$i<count($this->tokens);$i++) {
            if ($this->tokens[$i]->id  == \T_VARIABLE) {
                $this->tokens[$i]->text = substr($this->tokens[$i]->text, 1);
            }
        }
        return $this;
    }

    public function filter(array $criteria = [\T_WHITESPACE]): array
    {
        $tmp = [];
        for($i=0;$i<count($this->tokens);$i++) {
            if ( !in_array($this->tokens[$i]->id, $criteria)) {
                $tmp[] = $this->tokens[$i];
            }
        }
        return $tmp;
    }
}




$code = 'gen_tst_prse.php';

$tkr = new TokenizeExample($code);
$tkr->sanitzeVars();
// var_dump($tkr->getTokens());

// exit(23);
foreach($tkr->filter([T_CLOSE_TAG, T_OPEN_TAG, T_WHITESPACE]) as $itm) {
    echo implode(' :: ', [$itm->getTokenName(), $itm->text, PHP_EOL]);
    //var_dump([$itm, $itm->getTokenName()]);
}

echo PHP_EOL . PHP_EOL;
echo implode(' ', $tkr->filter([T_CLOSE_TAG, T_OPEN_TAG, T_WHITESPACE]));
echo PHP_EOL . PHP_EOL;