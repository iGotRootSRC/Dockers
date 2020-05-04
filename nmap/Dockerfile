FROM alpine

COPY setup.sh /tmp/setup.sh
COPY scripts/NSE_setup.sh /NSE_setup.sh
COPY scripts/nmap_scripts_update.sh /nmap_scripts_update.sh
COPY scripts/find_vuln_nse.sh /find_vuln_nse.sh

RUN sh /tmp/setup.sh && rm -r /tmp/setup.sh
RUN sh /NSE_setup.sh
RUN sh /nmap_scripts_update.sh

RUN /usr/bin/nmap --script-updatedb
