#### 1. About

- URL: `https://github.com/tomnomnom/httprobe`
- Take a list of domains and probe for working HTTP and HTTPS servers


#### 2. Build & run
```
# docker build -t httprobe https://github.com/tomnomnom/httprobe.git
# docker run --rm -it httprobe
```


#### 3. Usage
```
# cat domains.txt | docker run -i httprobe <args>
```