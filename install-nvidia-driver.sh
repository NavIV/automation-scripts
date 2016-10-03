#!/bin/bash


readonly VERSION="367.35"
readonly FILENAME="NVIDIA-Linux-x86_64-$VERSION.run"
readonly FILEURL="http://jp.download.nvidia.com/XFree86/Linux-x86_64/$VERSION/$FILENAME"

InstallProcess() {

  echo sudo stop lightdm

  echo cd $HOME/Downloads
  echo wget -nc $FILEURL
  echo chmod +x $FILENAME
  echo sudo sh $FILENAME $1
}

#Check if argument is no-opengl or does not exist
case "$1" in
  "no-opengl")
    echo "==== Install NVIDIA Driver $VERSION without OpenGL Files ==="
    InstallProcess --no-opengl-files
    ;;
  *)
    echo "==== Install NVIDIA Driver $VERSION ==="
    InstallProcess
    ;;
esac
