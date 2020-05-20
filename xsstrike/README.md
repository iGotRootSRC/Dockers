#### 1. About

- URL: `https://github.com/s0md3v/XSStrike`
- "Most advanced XSS scanner." - s0md3v


#### 2. Build
```
docker build -t xsstrike .
```


#### 3. Example
```
docker run --rm -it xsstrike -u "https://example.com/index.php?parameter=test" --crawl -l 3
```