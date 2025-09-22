<?php

declare(strict_types=1);
/**
 * Creating data structure from CSV or vice versa
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package Koalas_Zep
 * @version 0.0.3
 * @since 2025-09-04
 */

namespace Koalas\Stream\File;
use Stringable;

class CsvManager implements Stringable
{

    private array $dta = [];
    private array $cols = [];

    public function __construct(
        private ?string $fn = null,
        private ?int $len = null,
        private string $sep = ",",
        private string $enc = "\"",
        private string $esc = "\\"
    ) {
        //@FIXME - validate path
        if (! is_null($this->fn))
            $this->readCsv($this->fn);
    }

    public function readCsv(string $fn): void
    {
        if(!file_exists($fn))
            throw new \InvalidArgumentException(('File not found: ' . $fn));
        $this->fn = $fn;
        $tmp = array_map(
            function ($a) {
                // @see https://wiki.php.net/rfc/kill-csv-escaping
                return str_getcsv($a, escape: $this->esc);
            },
            file($fn)
        );
        $this->cols = array_shift($tmp);

        foreach ($tmp as $row) {
            $this->dta[] = array_combine($this->cols, $row);
        }
    }

    public function toCsv(string $fn):  void
    {
        file_put_contents($fn, implode(PHP_EOL, $this->asArray()));
    }

    public function asArray(): array
    {
        return $this->dta;
    }

    public function __toString(): string
    {
        return implode(PHP_EOL, $this->literal());
    }

    public function asList(): ListClass
    {
        return new ListClass($this->dta);
    }

    public function literal(): array
    {
        $tmp = [implode($this->sep, $this->cols)];
        foreach ($this->dta as $row) {
            $tmp[] = implode($this->sep, $row);
        }

        return $tmp;
    }

    public function columns(bool $phpNatArr=true): array
    {
        return ($phpNatArr)
                ? $this->cols
                : new ListClass($this->cols);
    }
}