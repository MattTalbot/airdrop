#! /bin/bash

source ./scripts/deliver.sh
source ./scripts/distro.sh

GREEN='\033[1;32m'
RED='\033[1;31m'
NC='\033[0m'
DISTRO_UGLY=$(getDistro)
DISTRO="${DISTRO_UGLY,,}"

# distro packages
if [[ $DISTRO == *"manjaro"* ]] || [[ $DISTRO == *"arch"* ]]; then
    echo -e "${GREEN}>>>>> Found $DISTRO_UGLY using pacman <<<<<${NC}"

    # install with pacman
    yes | sudo pacman -Syu
    yes | sudo pacman -S ufw gufw ufw-extras neofetch vim openconnect python-pygments nodejs npm curl
    yes | sudo pamac install flatpak libpamac-flatpak-plugin
elif [[ $DISTRO == *"ubuntu"* ]] || [[ $DISTRO == *"debian"* ]]; then
    echo -e "${GREEN}>>>>> Found $DISTRO_UGLY using apt <<<<<${NC}"

    # install with apt
    sudo apt-get update
    sudo apt install ufw gufw ufw-extras neofetch vim openconnect python-pygments nodejs npm curl
    sudo apt install flatpak gnome-software-plugin-flatpak

    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
else
    echo -e "${RED}>>>>> Distro unknown exiting install <<<<<${NC}"

    exit
fi

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# settings
sudo systemctl enable ufw #enables uncomplicated firewall
echo -e "${RED}>>>>> Uncomplicated Firewall Status <<<<<${NC}"
sudo ufw status

# install flatpaks
sudo flatpak install flathub us.zoom.Zoom -y
sudo flatpak install flathub com.slack.Slack -y
sudo flatpak install flathub com.visualstudio.code-oss -y
sudo flatpak install flathub com.vivaldi.Vivaldi -y
sudo flatpak install flathub com.discordapp.Discord -y
sudo flatpak install flathub org.libreoffice.LibreOffice -y
sudo flatpak install flathub com.google.Chrome -y

# reboot
echo -e "${GREEN}>>>>> Install finished time to reboot <<<<<${NC}"
