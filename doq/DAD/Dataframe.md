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



Each column is also indexed (consecutive ```int``` .. s.a.)


|$\color{Blue}{\textsf{[rowNum]}}$ / $\color{Darkgray}{\textsf{[colNum]}}$|$\color{Darkgray}{\textsf{[0]}}$|$\color{Darkgray}{\textsf{[1]}}$|$\color{Darkgray}{\textsf{[2]}}$|
|---------------------------------| -------- | ------- |-------|
|$\color{Blue}{\textsf{[0]}}$     | January  | $250    | $250  |
|$\color{Blue}{\textsf{[1]}}$     | February | $80     | $250  |
|$\color{Blue}{\textsf{[2]}}$     | March    | $420    | $250  |

Optionally yo can <b>add</b> a $\color{Green}{\textsf{named index}}$




|$\color{Blue}{\textsf{[rowNum]}}$/ $\color{Darkgray}{\textsf{[colNum]}}$|$\color{Darkgray}{\textsf{[0]}}$|$\color{Darkgray}{\textsf{[1]}}$|$\color{Darkgray}{\textsf{[2]}}$ | $\color{Green}{\textsf{[index]}}$  |
|---------------------------------| -------- | ------- |-------|------------|
|$\color{Blue}{\textsf{[0]}}$| January  | $250    | $250  |      $\color{Green}{\textsf{first month}}$   |
|$\color{Blue}{\textsf{[1]}}$| February | $80     | $250  |      $\color{Green}{\textsf{second month}}$   |
|$\color{Blue}{\textsf{[2]}}$| March    | $420    | $250  |      $\color{Green}{\textsf{third month}}$   |



Addionally a list of $\color{Green}{\textsf{column names}}$ is managed - eg: 

```php
['Month', 'Savings', 'Spendings']

```
