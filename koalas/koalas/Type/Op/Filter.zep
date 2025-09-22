/**
 * Class For filter operations on Arrrays
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package PhpLab
 * @version 0.0.3
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
        return this->generic(value, Filter::SW);
    }

     public function contains(value) -> <Filter>
    {
        return this->generic(value, Filter::CT);
    }

    public function ends(value) -> <Filter>
    {
        return this->generic(value, Filter::EW);
    }


    public function between(min, max) -> <Filter>
    {
        if (min > max) {
            var tmp;
            let tmp = max;
            let max = min;
            let min = tmp;
        }
            
        return this->generic([min, max], Filter::BT);
    }

    public function eq(value) -> <Filter>
    {
        return this->generic(value, Filter::EQ);
    }

    public function ne(value) -> <Filter>
    {
        return this->generic(value, Filter::NE);
    }

    public function gt(value) -> <Filter>
    {
        return this->generic(value, Filter::GT);
    }

    public function ge(value) -> <Filter>
    {
        return this->generic(value, Filter::GE);
    }   

    public function lt(value) -> <Filter>
    {
        return this->generic(value, Filter::LT);
    }

    public function le(value) -> <Filter>
    {
        return this->generic(value, Filter::LE);
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
                 
            case  Filter::EQ: 
                    return  realVal == expected;

            case Filter::NE:
                    return realVal != expected;

            case  Filter::GT: 
                    return  realVal > expected;
            
            case  Filter::GE: 
                    return  realVal >= expected;

            case Filter::LT:
                    return realVal < expected;
            
            case Filter::LE:
                    return realVal <= expected;
            
            case Filter::SW:
                    return str_starts_with(realVal, expected);

            case Filter::CT:
                    return str_contains(realVal, expected);        
            
            case Filter::EW:
                    return str_ends_with(realVal, expected);        
            
            case Filter::BT:
                    return (realVal <= expected[1] && realVal >= expected[0]);

            case Filter::ISIN:
                    return in_array(realVal, expected);

            case Filter::NIN:
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
