#! /bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
dft=dotfiles.tar.gz

if [ -f "$dft" ]; then
  echo -e "${RED}Removed old tar${NC}"
  rm -rf dotfiles.tar.gz
fi

echo -e "${GREEN}Created new tar${NC}"
tar -czvf dotfiles.tar.gz dotfiles