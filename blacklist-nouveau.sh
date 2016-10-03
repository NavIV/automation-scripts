#!/bin/bash

echo -e "blacklist nouveau\nblacklist lbm-nouveau\noptions nouveau modeset=0\nalias nouveau off\nalias lbm-nouveau off" | sudo tee /etc/modprobe.d/blacklist-nouveau.conf > /dev/null

echo options nouveau modeset=0 | sudo tee /etc/modprobe.d/nouveau-kms.conf > /dev/null

sudo update-initramfs -u
