## Building and installaing extension

```sh
# extension_dir = "/opt/homebrew/lib/php/pecl/20240924" 

sven@Thanos koalas % zephir build

Compiling...
 Zephir version [...]
 Installing...
Extension installed.
Add "extension=koalas.so" to your php.ini
Don't forget to restart your web server
# Extension dir - e.g: /opt/homebrew/lib/php/pecl/20240924
sven@Thanos koalas % sudo cp koalas.so /opt/homebrew/lib/php/pecl/20240924/

# php.ini (loaded) /opt/homebrew/etc/php/8.4/php.ini

sven@Thanos koalas % cl

svenschrodt@Thanos doq % php -m              
[PHP Modules]
bcmath
...
__koalas__
...

zephir_parser

```

### phpinfo()

<img src="phpinfo.png" width="600">