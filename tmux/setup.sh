#!/bin/sh

BASE_DIR="$HOME"
CURR_DIR=`pwd`

if [ -e "$HOME/.tmux.conf" ]; then
  echo "[INFO] Found existing .tmux.conf in your \$HOME directory. Please remove or backup it manually.\n"
else 
  echo "[INFO] Installing..."

  # link tmux.conf and tmux.conf.local
  ln -s $CURR_DIR/tmux.conf $BASE_DIR/.tmux.conf
  ln -s $CURR_DIR/tmux.conf.local $BASE_DIR/.tmux.conf.local
  
  # Finally~
  echo "[Success] Install tmux enviroment success!"
fi
