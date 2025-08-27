/**
 * Class For filter operations on Arrrays
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package PhpLab
 * @version 0.0.2
 * @since 2025-08-21
 */


namespace Koalas\Type\Op;


class Filter
{
    protected criterion = "" {
        set, get
    };
    protected dta = [];
    protected origin = [] {
        get
    };

   const EQ = "=="; // equals
   const NE = "!="; // not equals

   const GT = ">"; // greater than
   const LT = "<"; // less than

   const GE = ">="; // greater than or equals
   const LE = "<="; // less than or equals

   const SW = "SW"; // starts with
   const EW = "EW"; // ends with

   const CT = "CT"; // contains
   const BT = "BT"; // between

   const MIN = "MIN"; // min()
   const MAX = "MAX"; // max()

   const ISIN = "IN"; //  in() 
   const NIN = "NIИ"; // not in() 
    
    public function __construct(dta) 
    {
        // Cloning dta in origin @see Filter::reset()
        let this->dta = dta;
        let this->origin =  this->dta;
    }

    // @FIXME: multiple column 
    public function withCrit(crit) -> <Filter>
    {
        let this->criterion = crit;
        return this;
    }
    
    public function starts(value) -> <Filter>
    {
        return this->generic(value, self::SW);
    }

     public function contains(value) -> <Filter>
    {
        return this->generic(value, self::CT);
    }

    public function ends(value) -> <Filter>
    {
        return this->generic(value, self::EW);
    }


    public function between(min, max) -> <Filter>
    {
        if (min > max) {
            var tmp;
            let tmp = max;
            let max = min;
            let min = tmp;
        }
            
        return this->generic([min, max], self::BT);
    }

    public function eq(value) -> <Filter>
    {
        return this->generic(value, self::EQ);
    }

    public function ne(value) -> <Filter>
    {
        return this->generic(value, self::NE);
    }

    public function gt(value) -> <Filter>
    {
        return this->generic(value, self::GT);
    }

    public function ge(value) -> <Filter>
    {
        return this->generic(value, self::GE);
    }   

    public function lt(value) -> <Filter>
    {
        return this->generic(value, self::LT);
    }

    public function le(value) -> <Filter>
    {
        return this->generic(value, self::LE);
    }

    public function generic(value, string op) -> <Filter>
    {
        var tmp, itm;
        let tmp = [];

        for (itm in this->dta) {
            if (this->operate(itm[this->criterion], op, value)) {
                let tmp[] = itm;
            }
        }
        let this->dta = tmp;
        
        return this;
    }

    // helper for generic functions 
    public function operate(realVal, op, expected) -> bool
    {
        switch (op) {
                 
            case  self::EQ: 
                    return  realVal == expected;

            case self::NE:
                    return realVal != expected;

            case  self::GT: 
                    return  realVal > expected;
            
            case  self::GE: 
                    return  realVal >= expected;

            case self::LT:
                    return realVal < expected;
            
            case self::LE:
                    return realVal <= expected;
            
            case self::SW:
                    return str_starts_with(realVal, expected);

            case self::CT:
                    return str_contains(realVal, expected);        
            
            case self::EW:
                    return str_ends_with(realVal, expected);        
            
            case self::BT:
                    return (realVal <= expected[1] && realVal >= expected[0]);

            case self::ISIN:
                    return in_array(realVal, expected);

            case self::NIN:
                    return !in_array(realVal, expected);

            default:
                    return false;
                    
        };

        return false;
    }

  
    public function min(string col) -> mixed
    {
        return min(array_values(array_column(this->dta, col)));
    }

    public function max(string col) -> mixed
    {
        return max(array_values(array_column(this->dta, col)));
    }
    
    public function uniq(string col) -> array
    {
        return array_values(array_unique(array_column(this->dta, col)));
    }

    public function reset() -> <Filter>
    {
        let this->dta = this->origin;
        return this;
    }

    public function getDta() -> array
    {
        return this->dta;
    }
}
