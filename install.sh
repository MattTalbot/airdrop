#! /bin/bash

GREEN='\033[1;32m'
NC='\033[0m'

source ./scripts/deliver.sh

# install arch pacs
yes | sudo pacman -Syu
yes | sudo pacman -S ufw neofetch vim openconnect python-pygments nodejs npm
yes | sudo pamac install gnome-layout-switcher flatpak libpamac-flatpak-plugin

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# settings
sudo ufw enable #enables uncomplicated firewall

# install flatpaks
sudo flatpak install flathub us.zoom.Zoom -y
sudo flatpak install flathub com.slack.Slack -y
sudo flatpak install flathub com.visualstudio.code-oss -y
sudo flatpak install flathub com.vivaldi.Vivaldi -y
sudo flatpak install flathub com.discordapp.Discord -y 
sudo flatpak install flathub org.libreoffice.LibreOffice -y

# reboot
echo -e "${GREEN}Install finished time to reboot${NC}"