#!/bin/sh

cd /home/hplc/ftpproxy
export HTTP_PROXY="192.168.1.8:8080"
/usr/bin/fetch ftp://192.168.1.139/ftpproxy/url.txt
/usr/bin/fetch ftp://192.168.1.139/ftpproxy/url1.txt
/usr/local/bin/wget -i url.txt -O index.html
/usr/local/bin/wget -i url1.txt -O index1.html

/usr/bin/ftp -a 192.168.1.139 << EOF
user cy password
cd ftpproxy
binary
mput *
a
quit
EOF
