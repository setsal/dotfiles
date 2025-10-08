#!/bin/bash
#
# All in one quick setup script
#
# Author: setsu
#
# Usage:
#   bash setup.sh [options]
#
# Options:
#   all               - Install all dotfiles configuration
#   bash              - Install bash configuration
#   zsh               - Install zsh configuration
#   tmux              - Install tmux configuration
#   vim               - Install vim configuration
#

# TODO
# - Check the command exist before execute
# - Add the process bar
# - Add the feature to install basic command, ex: zsh, git, vim, tmux...

set -e

# Variable
DOTFILES_DIR=$(pwd)
ZSH_CUSTOM_DIR="$HOME/.oh-my-zsh/custom"

# Function
#{{{
function setup_zsh() {
  # Install oh-my-zsh
  if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "oh-my-zsh is already installed"
  else
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  fi

  # Backup existing .zshrc
  if [ -e "$HOME/.zshrc" ]; then
    echo "Found ~/.zshrc. Backing up to ~/.zshrc.bak"
    mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
  fi

  # Symlink .zshrc
  ln -s "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"

  # Install spaceship theme
  if [ -d "$ZSH_CUSTOM_DIR/themes/spaceship-prompt" ]; then
    echo "Spaceship theme is already installed"
  else
    echo "Installing spaceship theme"
    git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM_DIR/themes/spaceship-prompt"
    ln -s "$ZSH_CUSTOM_DIR/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM_DIR/themes/spaceship.zsh-theme"
  fi

  echo "Zsh setup complete"
}

function setup_tmux() {
  # Backup existing .tmux.conf
  if [ -e "$HOME/.tmux.conf" ]; then
    echo "Found ~/.tmux.conf. Backing up to ~/.tmux.conf.bak"
    mv "$HOME/.tmux.conf" "$HOME/.tmux.conf.bak"
  fi
  if [ -e "$HOME/.tmux.conf.local" ]; then
    echo "Found ~/.tmux.conf.local. Backing up to ~/.tmux.conf.local.bak"
    mv "$HOME/.tmux.conf.local" "$HOME/.tmux.conf.local.bak"
  fi

  # Symlink .tmux.conf and .tmux.conf.local
  ln -s "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"
  ln -s "$DOTFILES_DIR/tmux/tmux.conf.local" "$HOME/.tmux.conf.local"

  echo "Tmux setup complete"
}

function setup_vim() {
  # Install vim-plug
  if [ -e "$HOME/.vim/autoload/plug.vim" ]; then
    echo "vim-plug is already installed"
  else
    echo "Installing vim-plug"
    curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi

  # Symlink .vimrc
  if [ -e "$HOME/.vimrc" ]; then
    echo "Found ~/.vimrc. Backing up to ~/.vimrc.bak"
    mv "$HOME/.vimrc" "$HOME/.vimrc.bak"
  fi
  ln -s "$DOTFILES_DIR/vim/vimrc" "$HOME/.vimrc"

  # Install plugins
  vim +PlugInstall +qall

  echo "Vim setup complete"
}

function setup_bash() {
  # Backup existing .bashrc
  if [ -e "$HOME/.bashrc" ]; then
    echo "Found ~/.bashrc. Backing up to ~/.bashrc.bak"
    mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
  fi

  # Symlink .bashrc
  ln -s "$DOTFILES_DIR/bash/bashrc" "$HOME/.bashrc"

  echo "Bash setup complete"
}

function main() {
  if [ "$#" -eq 0 ]; then
    echo "No options provided. Running default setup (bash, zsh, tmux)..."
    setup_bash
    setup_zsh
    setup_tmux
    echo "Default setup complete!"
  else
    echo "Arguments provided, entering interactive mode..."
    PS3='Please enter your choice: '
    options=("Install All" "Install Bash" "Install Zsh" "Install Tmux" "Install Vim (optional)" "Quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "Install All")
                setup_bash
                setup_zsh
                setup_tmux
                read -p "Do you want to install vim configuration? (y/n) " -n 1 -r
                echo
                if [[ $REPLY =~ ^[Yy]$ ]]
                then
                    setup_vim
                fi
                break
                ;;
            "Install Bash")
                setup_bash
                break
                ;;
            "Install Zsh")
                setup_zsh
                break
                ;;
            "Install Tmux")
                setup_tmux
                break
                ;;
            "Install Vim (optional)")
                setup_vim
                break
                ;;
            "Quit")
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
  fi
}
#}}}

main "$@"