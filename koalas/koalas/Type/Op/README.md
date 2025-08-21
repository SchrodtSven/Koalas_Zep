# Koalas\Type\Op

Filtering arrays

### Examples
```zephir
use Koalas\Type\Op\Filter;

$my = new Filter(json_decode(file_get_contents('mock_detail.json'), true));

$my->withCrit('first_name')->starts('Ed');
$filtered = $my->getDta();

```