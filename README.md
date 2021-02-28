# config\_files

## Setup

Create symbolic links from repository contents to the $HOME directory:

```
ln -s ~/config_files/.vimrc ~/.vimrc
ln -s ~/config_files/.tmux.conf ~/.tmux.conf
ln -s ~/config_files/.alacritty.yml ~/.alacritty.yml
```

Before running the commands below, make sure you follow the proper installation instructions for the oh-my-zsh plugins listed under `plugins` in the .zshrc file

```
ln -s ~/config_files/.zshrc ~/.zshrc
ln -s ~/config_files/zsh_profiles ~/zsh_profiles
ln -s ~/config_files/palermo.zsh-theme ~/.oh-my-zsh/themes/palermo.zsh-theme
```

For the `.vimrc` to work properly, download and install `vim-plug` [here](https://github.com/junegunn/vim-plug).


