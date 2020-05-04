#### 1. About

- URL: `https://github.com/sullo/nikto`
- Nikto web server scanner


#### 2. Build
```
# git clone https://github.com/sullo/nikto && cd nikto
# docker build -t nikto .
```


#### 3. Run
```
# docker run --rm -it nikto -h http://192.168.9.11:8080
# cat urls.txt | docker run --rm -it nikto -h -
```
