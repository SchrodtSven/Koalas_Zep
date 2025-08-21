# Koalas

Not a snake, nor a panda and also not a bear!
Managing data in a snaky way - re-implementing my [PhascolarctosCinereus](https://github.com/SchrodtSven/PhascolarctosCinereus) (PHP 8.4 stuff) in Zephir


## The <bigger>🐘<bigger> (not PHP) in the room 

We want:

- [ ] access operators for slicing; stepping like
  - `[2:]` (third element to end)
  - `[0::2]` (from start to end, stepped by 2)
- [ ] filtering data with PHP 8.4+ the snaky way 🐍.
  - tbh: also and more important: the [🐼, 🐼] way.

> [!IMPORTANT]  
> This is a <abbr title="Proof of concept">POC</abbr>, <abbr title="Work in progress">WIP</abbr>, <abbr title="Where to fly?">WTF</abbr> and only for myself with <u>no mile stones or deadline</u>.



### [DAD - Design& Architecture Dossier](doq/DAD.md)




### Ideas

```php

with($dataStructure)->(function($item) {
  // process
})


// Queries in DataFrames:
  $data->query("year == 2007")->query("continent == 'Europe'")
```

> [!NOTE]  
> This section will be updated 

## Subnamespaces 

- <kbd>Koalas\Core</kbd> Core elements of Koalas
- <kbd>Koalas\Type</kbd> Using data types/structures with a (oop) fluent interface 