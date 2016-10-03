#!/bin/bash

readonly FILENAME="NVIDIA-Linux-x86_64-367.35.run"
readonly FILEURL="http://jp.download.nvidia.com/XFree86/Linux-x86_64/367.35/${FILENAME}"

sudo apt-get remove nvidia* && sudo apt-get autoremove

echo -e "blacklist nouveau\nblacklist lbm-nouveau\noptions nouveau modeset=0\nalias nouveau off\nalias lbm-nouveau off" | sudo tee /etc/modprobe.d/blacklist-nouveau.conf > /dev/null

echo options nouveau modeset=0 | sudo tee /etc/modprobe.d/nouveau-kms.conf > /dev/null

sudo update-initramfs -u

sudo stop lightdm

cd $HOME/Downloads
wget -nc $FILEURL
chmod +x $FILENAME
sudo sh $FILENAME
