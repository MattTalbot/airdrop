df=./dotfiles

if [ -d "$df" ]; then
    rm -rf ./dotfiles
fi

tar -xvzf dotfiles.tar.gz
