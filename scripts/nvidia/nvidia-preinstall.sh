sudo apt update
sudo apt upgrade
sudo apt autoremove nvidia* --purge
sudo /usr/bin/nvidia-uninstall
sudo /usr/local/cuda-X.Y/bin/cuda-uninstall
sudo apt install software-properties-common -y
sudo add-apt-repository contrib non-free-firmware
sudo add-apt-repository contrib non-free
sudo apt update
sudo apt install linux-headers-amd64
sudo apt install nvidia-detect

echo ">>>>> run nvidia-detect and install recommended driver then reboot <<<<<"

