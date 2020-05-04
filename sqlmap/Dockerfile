FROM alpine:latest


RUN apk add --update python
RUN apk add --update git
RUN git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev

WORKDIR /sqlmap-dev

ENTRYPOINT ["python", "sqlmap.py"]
