/**
 * Class representing a data structure called <Dataframe> - consisting of 
 *
 * - columns
 * - rows
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.3
 * @since 2025-08-19
 */
namespace Koalas\Type;
use Koalas\Core\Dstr;
use Koalas\Core\Intl\IdxSlc;
use Koalas\Stream\File\CsvManager;

class Dataframe implements \Stringable, Dstr
{
    public loc; // <IdxSlc>

    public iloc; // <IdxSlc>

    // names corresp. to pd.df() - may change
    protected data = null;
    protected index = null;
    protected columns = null;
    protected dtype = null;
    protected copy = null;

    protected static mgrz = [

    ];

    protected dta = [];

    public function __construct(data=null, index=null, columns=null, dtype=null, copy=null)
    {
        let this->loc = new IdxSlc(this);
        let this->iloc = new IdxSlc(this);
        let this->data = data;
        let this->index = index;
        let this->columns = columns;
        let this->dtype = dtype;
        let this->copy = copy;
        this->rstr();
    }

    public function __toString() -> string
    {
        // @FIXME
        return "<Dataframe>";
    }

    public function readCsv(string fnm) -> <Dataframe>
    {
        var mgr = Dataframe::getCsvRdr();
        mgr->readCsv(fnm);
        let this->columns = mgr->columns();
        let this->dta = mgr->asArray();
        return this;
    }

    public function readJson(string fnm) -> <Dataframe>
    {
        return this;
    }

    public function toCsv(string fnm) -> <Dataframe>
    {
        return this;
    }

    public function toJson(string fnm) -> <Dataframe>
    {
        return this;
    }

    public static function getCsvRdr() -> <CsvManager>
    {
        if !isset Dataframe::mgrz["csv"] {
            let Dataframe::mgrz["csv"] = new CsvManager();
        }
        return  Dataframe::mgrz["csv"];
    }

    public function getDta() -> array
    {
        return this->dta;
    }

    public function set(int idx, mixed val)
    {   
        if is_null(idx) {
            let this->dta[] = val;
        } else {
            let this->dta[idx] = val;
        }
        
    }

    public function slc(int strt, int end = null) // end will be *excluded*
    {
        var last = count(this->dta);
        var len = 0;

        if is_null(end) {
            //let last --;
            let len = last - strt;
        } else {
            let len = end - strt;
        }

        return array_slice(this->dta, strt, len);
    }

    public function columns() -> array
    {
        return this->columns;
    }

    protected function rstr() -> void
    {
        // re-structure self::dta
        /***
         * self::colz = []
         * self::dta[
         *       [],
         *.      [], ...
         * ]        
         */
    }
}
