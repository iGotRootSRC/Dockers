FROM alpine:latest

COPY setup.sh /tmp/setup.sh
RUN sh /tmp/setup.sh && rm -r /tmp/setup.sh
ENTRYPOINT ["/root/dex2jar/d2j-dex2jar.sh"]
