#### 1. About

- URL: `https://github.com/ffuf/ffuf`
- A fast web fuzzer written in Go.


#### 2. Build
```
# docker build -t ffuf .
```


#### 3. Example
Set variable $list to your preffered wordlist
```
docker run --rm -it -v $list:/x \
ffuf -w /path/to/wordlist -u https://target/FUZZ
```
