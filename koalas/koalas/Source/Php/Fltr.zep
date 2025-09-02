/**
 * Class filtering Token lists (being sub class of <SplDoublyLinkedList>)
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
 * @since 2025-09-01
 */
namespace Koalas\Source\Php;
use SplDoublyLinkedList;
use Koalas\Source\Php\TknLst;

class Fltr
{
    private lst;

    private crt = "id"; // current criterion 

    private crtz = []; // current list of criteria



    public function __construct(<SplDoublyLinkedList> lst)
    {
        let this->lst = lst;
    }

    public function wth(string crt)
    {
        if is_array(crt) {
            let this->crtz = crt;
            let this->crt = "";
        } else {
            let this->crtz = [];
            let this->crt = crt;
        }
    }

    public function eq(var val) -> array
    {
        int i, last = count(this->lst);
        var itm;
        let last--;
        var tmp = [];
        for i in range(0, last) {
            let itm = this->lst[i];
            if (itm->id == val) || (itm->text == val) {
                let tmp[] = itm;
            }
        }
        return tmp;
    }

    // not equals
    public function ne(var val) -> array
    {
        int i, last = count(this->lst);
        var itm;
        let last--;
        var tmp = [];
        for i in range(0, last) {
            let itm = this->lst[i];
            if (itm->id != val) && (itm->text != val) {
                let tmp[] = itm;
            }
        }
        return tmp;
    }

    public function getLst() -> <SplDoublyLinkedList>
    {
        return this->lst;
    } 

    public function setLst(<SplDoublyLinkedList> lst) -> <Fltr>
    {
        let this->lst = lst;
        return this;
    }


}
