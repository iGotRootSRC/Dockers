FROM alpine:latest

COPY setup.sh /tmp/setup.sh
RUN sh /tmp/setup.sh && rm -r /tmp/setup.sh
ENTRYPOINT ["python", "/root/weevely3/weevely.py"]
