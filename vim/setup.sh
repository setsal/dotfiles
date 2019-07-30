#!/bin/sh

BASE_DIR="$HOME/.vim"
CURR_DIR=`pwd`

# Install the vim-plug for vim plugin manager
if [ -e ~/.vim/autoload/plug.vim ];
then
        echo "[INFO] Vim-plug have been installed!"
else
        echo "[INFO] Install the vim-plug for manger plugin"
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


# Create the config folder
mkdir -p $BASE_DIR/vimconfig
mkdir -p $BASE_DIR/colors


# link vimconfig & vimcolor dir
ln -s $CURR_DIR/vimconfig/* $BASE_DIR/vimconfig"
ln -s $CURR_DIR/colors/* $BASE_DIR/colors"

# link vimrc file
ln -s $CURR_DIR/vimrc $HOME/.vimrc

# Install Vim plugin in vimrc
vim -c PlugInstall -c q -c q

# Finally~
echo "[Success] Install vim enviroment success!"
