#### 1. About

- URL: `https://github.com/nmap/nmap`
- the network scanner (network mapper)


#### 2. Build & run
```
# docker build -t nmap .
# docker run --rm -it nmap
```


#### 3. Examples
```
# nmap 192.168.10.2 -Pn -n -p8180 -sV --script=http-default-accounts
# nmap 192.168.10.2 -Pn -n -p22 -sV -sT --script vulners
# nmap 192.168.10.2 -Pn -n -p25 -sV --script='banner,banner-plus' --open
# nmap 192.168.10.2 -Pn -n -p22 -sV -sT --script='vulscan/vulscan' --script-args 'vulscandb=exploitdb.csv'
# nmap 192.168.10.2 -Pn -n -p1099 -sV -sT --script='*-vuln-*'
```


#### 4. Updates NSE scripts and core dependencies
```
# sh /nmap_scripts_update.sh
```


#### 5. Find NSE scripts for vuln-scanning
```
# sh /find_vuln_nse.sh smb
```
This will offer support for:
1. bruteforce of default web credentials
2. vulners database (`https://vulners.com`)
3. banner-plus script
4. vulscan
