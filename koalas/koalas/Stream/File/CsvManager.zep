/**
 * Creating data structure from CSV or vice versa
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package Koalas
 * @version 0.1
 * @since 2025-09-04
 */

namespace Koalas\Stream\File;
use Stringable;

class CsvManager implements Stringable
{

    private dta = [];
    private cols = [];
    private fnm = "";
    private sep = ",";
    private enc = "\"";
    private esc = "\\";
    private len = 0;



    public function __construct(
        string fnm = null,
        int len = null,
        string sep = ",",
        string enc =  "\"",
        string esc = "\""
    ) {

        
        if !is_null(len) {
            let this->len = len;
        }

        
        let this->sep = sep;
        let this->enc = enc;
        let this->esc = esc;
        if (! is_null(fnm)) {
            this->readCsv(fnm);
        }
            
    }

    public function readCsv(string fnm) -> void
    {
        if(!file_exists(fnm)) {
             throw new \InvalidArgumentException(("File not found: " . fnm));
        }
        let this->fnm = fnm;
        
        var tmp = file(fnm);
        
        var enc = this->enc;
        var esc = this->esc;
        var sep = this->sep; 
        var last = count(tmp);
        let last --;
        var i;

        for i in range(0, last) {
            let tmp[i] = str_getcsv(tmp[i], sep, enc, esc);
        }

        let this->cols = array_shift(tmp);
        //var_dump(tmp);
        // let i = 0;
        // let last --;
        // for i in range(0, last) {
        //     let tmp[i] = array_combine(this->cols, tmp[i]);
        // }
        let this->dta = tmp;
    }

    public function toCsv(string fnm) ->  void
    {
        file_put_contents(fnm, implode(PHP_EOL, this->asArray()));
    }

    public function asArray() -> array
    {
        return this->dta;
    }

    public function __toString() -> string
    {
        return implode(PHP_EOL, this->literal());
    }

    

    public function literal() -> array
    {
        var row;
        var tmp = [];
        let tmp[] = implode(this->sep, this->cols);
        for row in this->dta {
            let tmp[] = implode(this->sep, row);
        }

        return tmp;
    }

    public function columns() -> array
    {
        return this->cols;
    }
}