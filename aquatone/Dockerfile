FROM golang:latest

COPY setup.sh /tmp/setup.sh
RUN sh /tmp/setup.sh && rm -r /tmp/setup.sh

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]

WORKDIR /tmp/results
