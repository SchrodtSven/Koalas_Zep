/**
 * Class managing generic grammar
 * - 
 * - symbolz
 * - syntax
 * 
 * @author Sven Schrodt<sven@schrodt.nrw>
 * @link https://github.com/SchrodtSven/Koalas_Zep
 * @package 
 * @version 0.0.2
 * @since 2025-08-25
 */
namespace Koalas\Source\Generic;

class Grammar
{
    const ASN_SGN = "="; // assignment sign

    const CHEVRONS_START = "<";  // open chevrons
    const CHEVRONS_END   = ">";  // close chevrons
    const PARENTHESES_START = "(";  // open parentheses
    const PARENTHESES_END   = ")";  // close parentheses
    const BRACES_START = "{";  // open braces
    const BRACES_END   = "}";  // close braces
    const BRACKETS_START = "[";  // open brackets
    const BRACKETS_END   = "]";  // close brackets
    const PIPE   = "|";  // close pipe
    const TICK = "´";  // open tick
    const BACKTICK   = "`";  // close backtick
    const SINGLE_QUOTE  = "'";  // close single quotes
    const DOUBLE_QUOTE = "\"";  // open double quotes
    const TYPOGRAPHIC_SINGLE_QUOTE_START = "‘";  // open typographic single quotes
    const TYPOGRAPHIC_SINGLE_QUOTE_END   = "’";  // close typographic single quotes
    const TYPOGRAPHIC_DOUBLE_QUOTE_START = "“";  // open typographic double quotes
    const TYPOGRAPHIC_DOUBLE_QUOTE_END   = "”";  // close typographic double quotes

}