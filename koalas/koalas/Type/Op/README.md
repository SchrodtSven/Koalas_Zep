# Koalas\Type\Op

Filtering arrays

### Examples
```zephir
use Koalas\Type\Op\Filter;

$filter = new Filter(json_decode(file_get_contents('mock_detail.json'), true));

$filter->withCrit('first_name')->starts('Ed');
$filtered = $filter->getDta();

```