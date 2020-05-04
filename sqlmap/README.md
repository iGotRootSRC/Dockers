#### 1. About

- URL: `https://github.com/sqlmapproject/sqlmap`
- Automatic SQL injection and database takeover tool


#### 2. Build
```
docker build -t sqlmap .
```


#### 3. Example
Specify target in ```$target``` host environment variable.
```
docker run --rm -it -e target="$target" -v /tmp/sqlmap:/root/.sqlmap/ sqlmap -u "$target" --threads=10 --risk=3 --level=5 --eta --dbms=MySQL --os=Linux --banner --is-dba --users --passwords --current-user --dbs --batch
```

Find logs from sqlmap in /tmp/sqlmap/ on host environment.

