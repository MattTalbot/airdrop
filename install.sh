#! /bin/bash

GREEN='\033[1;32m'
NC='\033[0m'

source ./scripts/deliver.sh

# Pacman Installs
yes | sudo pacman -Syu
yes | sudo pacman -S ufw neofetch vim python-pygments nodejs npm
yes | sudo pamac install gnome-layout-switcher flatpak libpamac-flatpak-plugin

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Settings
sudo ufw enable

# Install Flatpaks
sudo flatpak install flathub us.zoom.Zoom -y
sudo flatpak install flathub com.slack.Slack -y
sudo flatpak install flathub com.visualstudio.code-oss -y
sudo flatpak install flathub com.vivaldi.Vivaldi -y
sudo flatpak install flathub com.discordapp.Discord -y 
sudo flatpak install flathub org.libreoffice.LibreOffice -y

# Reboot
echo -e "${GREEN}Install finished time to reboot${NC}"