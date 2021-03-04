#!/bin/bash

# Ubuntu backup reinstall
# 
# example usage:
# ./reinstall.sh "/media/ben/My Passport/backup_U20"/

if [ -z "$1" ]; then echo Must specify a target path to load backup data from.; exit 1; fi

cwd=$(echo $PWD)
cd

rsync --progress "$1" /home/"$(whoami)"
sudo apt-key add ~/Repo.keys
sudo cp -R ~/sources.list* /etc/apt/
sudo apt-get update
sudo apt-get install dselect
sudo dpkg --set-selections < ~/Package.list
sudo dselect

cd $cwd
