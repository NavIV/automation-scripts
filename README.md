# automation-scripts

You can use these scripts after installing Ubuntu 14.04

### Install NVIDIA Graphic Driver
1. Go into CUI by `Ctrl` + `Alt` + `F1`
1. Execute `blacklist-nouveau.sh`
1. Reboot
1. Go into CUI again and Execute `install nvidia-driver.sh`
(If you do not want to install OpenGL Files, add `no-opengl` behind of execution command.)
1. Type `nvidia-smi` if NVIDIA Driver is installed with no problem
