#### 1. About

- URL: `https://github.com/tomnomnom/hacks/tree/master/kxss`
- Basic tool to check for reflected parameters nice for XSS testing


#### 2. Build
```
# docker build -t kxss .
```


#### 3. Example

```
echo 'https://xss-game.appspot.com/level1/frame?query=test' | docker run -i kxss
```
