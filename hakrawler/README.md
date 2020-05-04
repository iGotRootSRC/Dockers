#### 1. About

- URL: `https://github.com/hakluke/hakrawler`
- Simple, fast web crawler designed for easy, quick discovery of endpoints and assets within a web application


#### 2. Build
```
# docker build -t hakrawler .
```


#### 3. Example
```
docker run --rm -it -v $HOME/.config/subfinder/targets:/x: hakrawler -all -urls /x
```
