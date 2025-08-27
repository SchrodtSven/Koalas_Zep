/**
 * Class representing an n bit wide data structure 
 *  
 * @author Sven Schrodt<sven@schrodt.club>
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

    protected length;

    protected minValue = 0;

    protected maxValue;

    protected currentValue;

    protected format;

    const EXPONENT = 2;


    const ERROR_BETWEEN_CONSTRAINT = 'value MUST be between %d and %d, when using bit length: %d, %d given';

    public function __construct(int value, int length = 32)
    {
        let this->msb = length - 1;
        let this->length = length;
        let this->maxValue = pow(self::EXPONENT, length) - 1;
        let this->format = "%0" . this->length ."b";
        this->setCurrentValue(value);

    }

    public function getCurrentValue() -> int
    {
        return this->currentValue;
    }

    public function setCurrentValue(int value) -> <Bits>
    {
        if (value > this->maxValue || value < this->minValue) {
            throw new \InvalidArgumentException(
                sprintf(
                    self::ERROR_BETWEEN_CONSTRAINT,
                    this->minValue,
                    this->maxValue,
                    this->length,
                    value
                )
            );
        }
        let this->currentValue = value;
        return this;
    }


    public function getBinaryLiteral() -> string
    {
        return sprintf(this->format, this->currentValue);
    }


    public function setBinaryLiteral(string literal) -> <Bits>
    {
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
        let tmp = sprintf('%b', this->getCurrentValue());
        let parts = mb_str_split(tmp, 1);
        
        let res = array_map(parts, function (itm) {
            let itm = (itm == "1") ? "0" : "1";
            return itm;
        });
        this->setCurrentValue(bindec(implode("", res)));
        return this;
    }

    public function doAnd(<Bits> operand) -> <Bits>
    {
        return new self(this->currentValue & operand->currentValue);
    }

    public function doOr(<Bits> operand) -> <Bits>
    {
        return new self(this->currentValue | operand->currentValue);
    }

    public function doXor(<Bits> operand) -> <Bits>
    {
        return new self(this->currentValue ^ operand->currentValue);
    }

    

    /**
     * Get the value of maxValue
     *
     * @return int
     */
    public function getMaxValue() -> int
    {
        return this->maxValue;
    }

    /**
     * Set the value of maxValue
     *
     * @param int maxValue
     *
     * @return self
     */
    public function setMaxValue(int maxValue) -> <Bits>
    {
        let this->maxValue = maxValue;

        return this;
    }

    /**
     * Get the value of minValue
     *
     * @return int
     */
    public function getMinValue() -> int
    {
        return this->minValue;
    }

    /**
     * Set the value of minValue
     *
     * @param int minValue
     *
     * @return self
     */
    public function setMinValue(int minValue) -> <Bits>
    {
        let this->minValue = minValue;

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
     * Get the value of length
     *
     * @return int
     */
    public function getLength() -> int
    {
        return this->length;
    }
}
