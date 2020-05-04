#!/bin/bash

git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev


# create Dockerfile
cat > Dockerfile << _EOF_
FROM alpine:latest
RUN apk add --update python
COPY sqlmap-dev/ /sqlmap-dev/
WORKDIR /sqlmap-dev
ENTRYPOINT ["python", "sqlmap.py"]
_EOF_

# build the image
docker build -t sqlmap .
