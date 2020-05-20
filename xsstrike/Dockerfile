FROM alpine:latest


RUN apk add --update python3
RUN apk add --update py-pip
RUN pip3 install --upgrade pip
RUN apk add --update git
RUN git clone https://github.com/s0md3v/XSStrike.git XSStrike
RUN pip3 install fuzzywuzzy
RUN pip3 install tld
RUN pip3 install requests
WORKDIR /XSStrike

ENTRYPOINT ["python3", "xsstrike.py"]
