#! /bin/bash
GREEN='\033[1;32m'
RED='\033[1;31m'
NC='\033[0m'
dft=dotfiles.tar.gz

if [ -f "$dft" ]; then
  echo -e "${RED}>>>>> Removed old tar <<<<<${NC}"
  rm -rf dotfiles.tar.gz
fi

echo -e "${GREEN}>>>>> Created new tar <<<<<${NC}"
tar -czvf dotfiles.tar.gz dotfiles
