# dotfile
My dotfile~

## Getting Start

### Install
```
git clone https://github.com/setsal/dotfiles.git
```

### Setup Vim

I use [vim-plug](https://github.com/junegunn/vim-plug) to manage vim plugins

```
cd dotfile/vim
sh setup.sh
```

### Setup Tmux 
Just use the soft link to link to `~/.tmux.conf`

Really Thanks for the awesome tmux config from [gpakosz](https://github.com/gpakosz/.tmux)
```
ln -s dotfiles/tmux/.tmux.conf ~/.tmux.conf

```

### Setup Zsh

I use [oh my zsh](https://github.com/robbyrussell/oh-my-zsh)  to manage my zsh configure, plugins and themes. :P

The theme is [spaceship](https://github.com/denysdovhan/spaceship-prompt)

**Auto install script is todo :P**
