#!/bin/bash

# Put you code here

cp /home/ubuntu/passwd /home/ubuntu/passwd_new

awk '/saned/ {sub(/usr\/sbin\/nologin/, "bin/bash")} 1' passwd > passwd_new

sed -i '/avahi/ s/usr\/sbin\/nologin/bin\/bash/' passwd_new

awk -F: '{print $1,$3,$5,$7}' OFS=":" passwd_new > passwd_new2 && mv passwd_new2 passwd_new

sed -i '/daemon/d' passwd_new 

awk -F: 'BEGIN {OFS=":"} $2 %2 == 0 {$4 = "/bin/zsh"} { print }' passwd_new > passwd_new2 && mv passwd_new2 passwd_new
