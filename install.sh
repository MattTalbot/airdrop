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
    yes | sudo pacman -S ufw gufw ufw-extras neofetch vim openconnect python-pygments nodejs npm curl nix
elif [[ $DISTRO == *"ubuntu"* ]] || [[ $DISTRO == *"debian"* ]]; then
    echo -e "${GREEN}>>>>> Found $DISTRO_UGLY using apt <<<<<${NC}"

    # install with apt
    sudo apt-get update
    sudo apt install ufw gufw ufw-extras neofetch vim openconnect python-pygments nodejs npm curl nix
else
    echo -e "${RED}>>>>> Distro unknown exiting install <<<<<${NC}"

    exit
fi

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# settings
sudo systemctl enable ufw #enables uncomplicated firewall
sudo systemctl start ufw
sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing

echo -e "${RED}>>>>> Uncomplicated Firewall Status <<<<<${NC}"
sudo ufw status

# install nix packages
nix-env -iA nixpkgs.vscode
nix-env -iA nixpkgs.zoom-us
nix-env -iA nixpkgs.slack
nix-env -iA nixpkgs.vivaldi
nix-env -iA nixpkgs.discord
nix-env -iA nixpkgs.libreoffice

# install flatpaks
# sudo flatpak install flathub us.zoom.Zoom -y
# sudo flatpak install flathub com.slack.Slack -y
# sudo flatpak install flathub com.visualstudio.code-oss -y
# sudo flatpak install flathub com.vivaldi.Vivaldi -y
# sudo flatpak install flathub com.discordapp.Discord -y
# sudo flatpak install flathub org.libreoffice.LibreOffice -y
# sudo flatpak install flathub com.google.Chrome -y

# reboot
echo -e "${GREEN}>>>>> System Setup Finished <<<<<${NC}"
