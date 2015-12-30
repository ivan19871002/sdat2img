#!/bin/bash
user_=`whoami`
sudo rm -rf tmp
sudo rm -rf output
sudo rm -rf system
sudo rm -rf system.img
mkdir output
python ./sdat2img.py img/system.transfer.list img/system.new.dat output/system.img
mkdir tmp
sudo mount -t ext4 -o loop output/system.img tmp/
mkdir -p output/system
sudo cp -R tmp/* output/system/
sudo chown -R $user_ output/system/*
sudo umount tmp
sudo rm -rf tmp
