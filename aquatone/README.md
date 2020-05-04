#### 1. About

- URL: `https://github.com/michenriksen/aquatone`
- Go tool for HTTP screenshots


#### 2. Build
```
# docker build -t aquatone .
```


#### 3. Example

0. Local work directory
```
# mkdir aquatone_results && cd aquatone_results
```

1. Run
```
# docker run --rm -it \
-v /tmp/targets.txt:/tmp/targets \
-v `pwd`:/tmp/results \
aquatone -silent -scan-timeout 500 -http-timeout 6000 -threads 10 -ports small
```
