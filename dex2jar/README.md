#### 1. About

- URL: `https://github.com/pxb1988/dex2jar`
- convert APK to JAR


#### 2. Build
```
# docker build -t dex2jar .
```


#### 3. Example
```
# docker run --rm -it -v `pwd`:/tmp dex2jar -f /tmp/app.apk -o /tmp/app-dex2jar.jar
```
