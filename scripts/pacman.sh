#! /bin/bash

yes | sudo pacman -Syu
yes | sudo pacman -S ufw neofetch vim python-pygments
yes | sudo pamac install gnome-layout-switcher flatpak libpamac-flatpak-plugin