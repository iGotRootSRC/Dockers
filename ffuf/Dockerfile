FROM golang:latest

COPY setup.sh /tmp/setup.sh
RUN sh /tmp/setup.sh && rm -r /tmp/setup.sh
ENTRYPOINT ["/usr/bin/ffuf"]
