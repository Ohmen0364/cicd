#!/bin/sh -eux
if [[ -e /usr/sbin/sshd ]]; then
	/usr/sbin/sshd -De
else
apk add --no-cache openssh
sed -i 's|#Port 22|Port 32|g' /etc/ssh/sshd_config
sed -i 's|#PermitRootLogin prohibit-password|PermitRootLogin yes|g' /etc/ssh/sshd_config
apk add openssh-server openjdk11 
ssh-keygen -t rsa -f /root/id_rsa -q -P ""
ssh-keygen -A
echo "root:toor" | chpasswd
mkdir ~/.ssh 
while ! [ -e id_rsa.pub ]; do sleep 1; done 
cp id_rsa.pub ~/.ssh/authorized_keys 
/usr/sbin/sshd -De
fi
