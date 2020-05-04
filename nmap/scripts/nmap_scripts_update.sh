#!/usr/bin/env sh
# Update the local nmap-scripts (NSE) from SVN.

[ -z `which curl` ] && echo 'cURL is missing.' && exit
[ "$(id -u `whoami`)" -ne 0 ] && echo 'Run as root.' && exit

scripts=`find /usr -name '*.nse' -type f 2>/dev/null | grep -oE '.*/nmap/scripts/' | sort -u`
[ ! -e $scripts ] && echo "Path not found: $scripts" && exit

nselib=`find /usr -name 'nselib' -type d 2>/dev/null`
[ ! -e $nselib ] && echo "Path not found: $nselib" && exit

s_url='https://svn.nmap.org/nmap/scripts'
lib_url='https://svn.nmap.org/nmap/nselib'


# Proceed update - scripts
c=0
for i in `curl -sSL $s_url | grep -oE '".*.nse"' | sort -u | tr -d '"'`
do
    ([[ ! -e "$scripts/$i" ]] && [[ ! -e "$scripts/brute/$i" ]]) && \
    curl -sO "$s_url/$i" && mv "$i" $scripts && echo '[*] New:' $i && c=$((c+1))
done
[ $c -ne 0 ] && echo "Total scripts: $c" || echo "No new scripts for ya..."

# Proceed update - nselib
c=0
for i in `curl -sSL $lib_url | grep -oE '".*.lua"' | sort -u | tr -d '"'`
do
    [[ ! -e "$nselib/$i" ]] && curl -sO "$lib_url/$i" && \
    mv "$i" $nselib && echo '[*] New:' $i && c=$((c+1))
done
[ $c -ne 0 ] && echo "Total nselib: $c" || echo "No new nselib files for ya..."


# Move bruteforce scripts (new usage: nmap --script brute/ssh-brute).
brute_nse="$scripts/brute"
[ ! -e $brute_nse ] && mkdir $brute_nse
for i in `find $scripts -name '*-brute*.nse' | grep -v '/brute/'`; do
   mv $i $brute_nse
done
