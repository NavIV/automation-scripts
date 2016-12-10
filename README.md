# automation-scripts

You can use these scripts after installing Ubuntu 14.04.

Please change install version by editing scripts.

### Install NVIDIA Graphic Driver
1. Go into CUI by `Ctrl` + `Alt` + `F1`
1. Execute `blacklist-nouveau.sh`
1. Reboot
1. Go into CUI again and Execute `install-nvidia-driver.sh`<br>
(If you do not want to install OpenGL Files, add `no-opengl` behind of execution command.)
1. After installing, Type `nvidia-smi` if the Driver is installed with no problem

### Install NVIDIA CUDA Driver
1. Execute `install-cuda.sh`<br>
1. Answer some questions as follows

  - Do you accept the previously read EULA? : *accept*
  - Install NVIDIA Accelerated Graphics Driver for ~~ : *n*
  - Install the CUDA 7.5 Toolkit? : *y*
  - Enter Toolkit Location : (blank)
  - Do you want to install a symbolic link at ~~ : *y*
  - Install the CUDA 7.5 Samples? : *y*
  - Enter CUDA Samples Location : (blank)
  
### Install OpenCV
1. Execute `opencv.sh install`
1. Wait for a while...

### Install ROS Indigo
1. Execute `install-ros-indigo.sh`
1. Wait for a while...

### Install Autoware
1. Execute `install-autoware.sh`
1. Wait for a while...
