#  Phascolarctos Cinereus - Koalas

## DAD 

### Dataframe 

A Dataframe consists of <var>columns</var> and <var>rows</var> like a table:

| Month    | Savings | Spendings |
| -------- | ------- |-----------
| January  | $250    | $250      |
| February | $80     | $250      |
| March    | $420    | $250      |

#### Internals

Koalas <u>internally uses </u> a <var>list</var> (consecutive ```int``` <var>indices</var> starting with ```0```, stepped by ```++``` - named <var>rowNum</var>).
<code style="color : pink">text</code>

Each column is also indexed (consecutive ```int``` .. s.a.)


|      0   |     1   |    2  |  rowNum  |
| -------- | ------- |-------|----------|
| January  | $250    | $250  |      0   |
| February | $80     | $250  |      1   |
| March    | $420    | $250  |      2   |

Addionally a list of named columns is managed - eg: ```['Month', 'Savings', 'Spendings']```