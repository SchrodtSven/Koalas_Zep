<?php
/**
 * Zephir Tokens - project specific *NOT* official!
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
 * @since 2025-08-28
 */

namespace SchrodtSven\Koalas\Source\Zephir;

class Tknz
{
    private array $idToName;
    private array $nameToId = [
        "ZT_LET" => 1024, // 'let'
        "ZT_RT_TYP" => 1025, // '->'
        "ZT_VAR" => 1025, // 'var'
    ];

    public function __construct()
    {   
        $this->idToName = array_flip($this->nameToId);
    }

    /**
     * Get the value of idToName
     *
     * @return array
     */
    public function getIdToName(): array
    {
        return $this->idToName;
    }



    /**
     * Get the value of nameToId
     *
     * @return array
     */
    public function getNameToId(): array
    {
        return $this->nameToId;
    }

}