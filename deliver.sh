#! /bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'
df=./dotfiles

if [ -d "$df" ]; then
  echo -e "${RED}removed old dotfiles${NC}"
  rm -rf ./dotfiles
fi

echo -e "${GREEN}extract dotfiles from tar${NC}"
tar -xvzf dotfiles.tar.gz

echo -e "${GREEN}copied dotfiles to home${NC}"
cp -a $df/. $HOME/