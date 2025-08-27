/**
 * Class representing a bit 
 * 
 * 
 * @author Sven Schrodt<sven@schrodt.club>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package Koalas
 * @version 0.1
 * @since 2025-08-27
 */

namespace Koalas\Type\Binary;


class Bit
{
    private value = false;

    const C_TRUE = '1';

    const C_FALSE = '0';

    public function __construct(bool value = false)
    {
        let this->value = value;
    }

    // !false is funny, caus' it's true;-)
    public function not() -> <Bit>
    {
        let this->value = !this->value;
        return this;
    }

    public function __toString() -> string
    {
        return (this->value) ? self::C_TRUE : self::C_FALSE;
    }

    public function getCurrentValue() -> bool
    {
        return this->value;
    }
}
