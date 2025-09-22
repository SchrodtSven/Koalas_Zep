/**
 * Grammar class for KQL
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.3
 * @since 2025-08-22
 */
namespace Koalas\Core\Kql;
use SplDoublyLinkedList;

class Ast
{
    private tree = null;

    private parsed = [];

    public function __construct(array parsed)
    {
        let this->tree = new \SplDoublyLinkedList();
        let this->parsed = parsed;
    }

    public function getTree() -> <SplDoublyLinkedList>
    {
        return this->tree;
    }
}