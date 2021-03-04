#!/bin/bash

# Ubuntu backup all data in user profile and packages installed
# 
# NOTE: symbolic links, devices, permissions and ownerships, modification 
# times, ACLs and extended attributes are preserved
# 
# example usage:
# ./backup.sh "/media/ben/My Passport/backup_U20"/

if [ -z "$1" ]; then echo Must specify a target path to backup data to.; exit 1; fi

cwd=$(echo $PWD)
cd

dpkg --get-selections > ~/Package.list
sudo cp -R /etc/apt/sources.list* ~/
sudo apt-key exportall > ~Repo.keys
rsync -aAX --progress /home/"$(whoami)" "$1"

cd $cwd
