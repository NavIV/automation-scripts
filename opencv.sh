#!/bin/bash

readonly OPENCV_VERSION="2.4.11"
readonly WORKING_DIR="$HOME/.opencv_install"
readonly INSTALL_DIR="/usr/local"

InstallProcess() {

  #Install dependencies
  sudo apt-get -y install libopencv-dev build-essential cmake git libgtk2.0-dev pkg-config python-dev python-numpy libdc1394-22 libdc1394-22-dev libjpeg-dev libpng12-dev libtiff4-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev libtbb-dev libqt4-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils unzip


  #echo "Download OpenCV in $WORKING_DIR"
  [ -d "$WORKING_DIR" ] || mkdir -p "$WORKING_DIR"
  pushd "$WORKING_DIR"
  wget https://github.com/Itseez/opencv/archive/$OPENCV_VERSION.zip -nc
  unzip -o $OPENCV_VERSION.zip

  #echo "Build step"
  cd opencv-$OPENCV_VERSION
  mkdir build
  cd build
  cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=$INSTALL_DIR -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_OPENGL=ON -D WITH_VTK=ON -D CUDA_GENERATION=Auto ..
  make -j64
  sudo make install
  #echo "$INSTALL_DIR/lib" | sudo tee /etc/ld.so.conf.d/opencv.conf > /dev/null
  sudo ldconfig
}

UninstallProcess () {
  pushd $WORKING_DIR/opencv-$OPENCV_VERSION/build
  sudo make uninstall
  #rm -rf /etc/ld.so.conf.d/opencv.conf	
  sudo ldconfig
  rm -rf $WORKING_DIR/opencv-$OPENCV_VERSION/build
  popd
}

#Check if argument is install or uninstall
case "$1" in
  "install")
    echo "==== Install OpenCV $OPENCV_VERSION ==="
    InstallProcess
    ;;
  "uninstall")
    echo "==== Uninstall OpenCV $OPENCV_VERSION ==="
    UninstallProcess
    ;;
  *)
    echo "Please specify only one arguments 'install' or 'uninstall'"
    exit 1
    ;;
esac
