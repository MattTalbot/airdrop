#! /bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'
df=./dotfiles

if [ -d "$df" ]; then
  echo -e "${RED}>>>>> Removed old dotfiles <<<<<${NC}"
  rm -rf ./dotfiles
fi

echo -e "${GREEN}>>>>> Extracted dotfiles from tar <<<<<${NC}"
tar -xvzf dotfiles.tar.gz

echo -e "${GREEN}>>>>> Copied dotfiles to home directory <<<<<${NC}"
cp -a $df/. $HOME/
