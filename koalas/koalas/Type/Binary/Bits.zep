/**
 * Class representing an n bit wide data structure 
 *  
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package Koalas
 * @version 0.1
 * @since 2025-08-27
 */

namespace Koalas\Type\Binary;

use Koalas\Type\Str;

class Bits implements \Stringable
{

    protected lsb = 0;

    protected msb;

    protected len;

    protected minVl = 0;

    protected maxVl;

    protected currVl;

    protected frmt;

    const EXPONENT = 2;


    const ERROR_BETWEEN_CONSTRAINT = 'value MUST be between %d and %d, when using bit len: %d, %d given';

    public function __construct(int value, int len = 32)
    {
        let this->msb = len - 1;
        let this->len = len;
        let this->maxVl = pow(Bits::EXPONENT, len) - 1;
        let this->frmt = "%0" . this->len ."b";
        this->setCurrentVl(value);

    }

    public function getCurrentVl() -> int
    {
        return this->currVl;
    }

    public function setCurrentVl(int value) -> <Bits>
    {
        if (value > this->maxVl || value < this->minVl) {
            throw new \InvalidArgumentException(
                sprintf(
                    Bits::ERROR_BETWEEN_CONSTRAINT,
                    this->minVl,
                    this->maxVl,
                    this->len,
                    value
                )
            );
        }
        let this->currVl = value;
        return this;
    }


    public function getBinaryLiteral() -> string
    {
        return sprintf(this->frmt, this->currVl);
    }


    public function setBinaryLiteral(string literal) -> <Bits>
    {
        //@FIXME sanitize
        let this->value = bindec(literal); 
        return this;
    }

    public function __toString() -> string
    {
        return this->getBinaryLiteral();
    }

    public function not() -> <Bits>
    {
        var tmp, parts, res;
        let tmp = sprintf('%b', this->getCurrentVl());
        let parts = mb_str_split(tmp, 1);
        
        let res = array_map(parts, function (itm) {
            let itm = (itm == "1") ? "0" : "1";
            return itm;
        });
        this->setCurrentVl(bindec(implode("", res)));
        return this;
    }

    public function doAnd(<Bits> operand) -> <Bits>
    {
        return new self(this->currVl & operand->currVl);
    }

    public function doOr(<Bits> operand) -> <Bits>
    {
        return new self(this->currVl | operand->currVl);
    }

    public function doXor(<Bits> operand) -> <Bits>
    {
        return new self(this->currVl ^ operand->currVl);
    }

    

    /**
     * Get the value of maxVl
     *
     * @return int
     */
    public function getMaxVl() -> int
    {
        return this->maxVl;
    }

    /**
     * Set the value of maxVl
     *
     * @param int maxVl
     *
     * @return self
     */
    public function setMaxVl(int maxVl) -> <Bits>
    {
        let this->maxVl = maxVl;

        return this;
    }

    /**
     * Get the value of minVl
     *
     * @return int
     */
    public function getMinVl() -> int
    {
        return this->minVl;
    }

    /**
     * Set the value of minVl
     *
     * @param int minVl
     *
     * @return self
     */
    public function setMinVl(int minVl) -> <Bits>
    {
        let this->minVl = minVl;

        return this;
    }


    /**
     * Set the value of lsb
     *
     * @param int lsb
     *
     * @return self
     */
    public function setLsb(int lsb) -> <Bits>
    {
        let this->lsb = lsb;

        return this;
    }

    /**
     * Get the value of msb
     *
     * @return int
     */
    public function getMsb() -> int
    {
        return this->msb;
    }

    /**
     * Get the value of len
     *
     * @return int
     */
    public function getLength() -> int
    {
        return this->len;
    }
}
