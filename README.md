# config\_files

## Setup

1. Install [neovim](https://github.com/neovim/neovim)
    - Configure neovim to use the config in `.vimrc` by copying and pasting

    ```
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath=&runtimepath
    source ~/.vimrc
    ```

    inside `~/.config/neovim/init.vim`
    - [Source](https://vi.stackexchange.com/a/15548)

2. Install the `vim-plug` package manager by following [the instructions here](https://github.com/junegunn/vim-plug#installation).
    * Install the `nvim` version if you're using neovim (check with `which vim`).
    * You may need to run `:PlugInstall` the first time you open vim in order to install the packages listed in your `.vimrc`.
3. Install the oh-my-zsh plugins by following the installation instructions listed under `plugins` in the .zshrc file
4. Create symbolic links from repository contents to the $HOME directory by

```
sh create_symlinks.sh
```

