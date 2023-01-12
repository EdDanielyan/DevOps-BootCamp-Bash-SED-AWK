#!/bin/bash

# Put you code here

cp /etc/passwd /home/ubuntu/passwd_new

awk -F: '$1 == "saned" {$7="/bin/bash"} 1' /home/ubuntu/passwd_new OFS=":" passwd_new

sed -i '/avahi/s|/usr/sbin/nologin|/bin/csh|g' /home/ubuntu/passwd_new

awk -F: '{print $1,$3,$5,$7}' OFS=":" /home/ubuntu/passwd_new > /home/ubuntu/passwd_new2

sed -i '/daemon/d' passwd_new 
