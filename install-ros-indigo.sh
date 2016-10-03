#!/bin/bash

# for Ubuntu14.04

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'

wget http://packages.ros.org/ros.key -O - | sudo apt-key add -

sudo apt-get update

sudo apt-get -y install ros-indigo-desktop-full

sudo rosdep init

rosdep update

echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
