## Building and installaing extension

```sh
sven@Thanos koalas % zephir build

Compiling...
 Zephir version [...]
 Installing...
Extension installed.
Add "extension=koalas.so" to your php.ini
Don't forget to restart your web server

svenschrodt@Thanos doq % php -m              
[PHP Modules]
...
koalas
...

```
Or use <kbd>Koalas_Zep % ./t00lz/build.sh</kbd>, that script will also build the stubs (PHP pseudo code with signatures, param & return type hints for IDE usage)

### phpinfo()

<img src="ko_2.png" width="600">