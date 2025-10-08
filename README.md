# dotfile
My dotfile~

## Getting Started

### Installation
```bash
git clone https://github.com/setsal/dotfiles.git
cd dotfiles
```

### Usage
Run the setup script to start the installation process.

**Default Installation (bash, zsh, tmux)**
To run the default setup, which installs configurations for `bash`, `zsh`, and `tmux`, run the script without any arguments:
```bash
bash setup.sh
```

**Interactive Installation**
To choose which components to install, run the script with any argument (e.g., `interactive`):
```bash
bash setup.sh interactive
```
This will open an interactive menu where you can choose to install all configurations at once or select individual components like `bash`, `zsh`, `tmux`, and `vim`.

The script will automatically back up any existing dotfiles before creating new symlinks.