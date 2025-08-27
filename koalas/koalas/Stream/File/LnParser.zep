/**
 * Simple parser for file contents line-by-line
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
 * @since 2025-08-27
 */
namespace Koalas\Stream\File;
use Koalas\Core\Kql\Entity\Lst;

class LnParser
{
    const COM_SGN = ";";
    const ERR_404 = "File not found -> %s";

    protected fileName = "" {
        get, set
    };

    protected cnt = "";

    protected lns = [];

    protected prePrse = [];

    protected ignoreComment = true; 



    public function __construct(string fnm)
    {
        let this->fileName = fnm;
        if !file_exists(fnm) {
            throw new \InvalidArgumentException(sprintf(self::ERR_404, fnm));
        }
        let this->cnt = file_get_contents(fnm);
        let this->lns = explode(PHP_EOL, this->cnt);
    }

    public function getLns() -> array
    {
        return this->lns;
    }

    public function getPrePrse() -> array
    {
        return this->prePrse;
    }

    public function parse(string sep = ":") -> array
    {
        var tmp, itm;
        let tmp = [];
        for itm in this->lns {
            if(!str_starts_with(itm, self::COM_SGN)) {
                let tmp[] = explode(sep, itm);
            }
                
            
        }
        let this->prePrse = tmp;
        return tmp;
    }

}