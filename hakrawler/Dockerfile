FROM golang:latest

RUN apt update &&\
    go get github.com/hakluke/hakrawler

ENTRYPOINT [ "hakrawler" ]
