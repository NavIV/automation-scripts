#!/bin/bash

readonly FILENAME="NVIDIA-Linux-x86_64-367.35.run"
readonly FILEURL="http://jp.download.nvidia.com/XFree86/Linux-x86_64/367.35/${FILENAME}"

sudo stop lightdm

cd $HOME/Downloads
wget -nc $FILEURL
chmod +x $FILENAME
sudo sh $FILENAME
