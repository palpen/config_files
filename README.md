# config\_files

## Setup

Create symbolic links from repository contents to $HOME directory:

```
ln -s ~/config_files/.vimrc ~/.vimrc
ln -s ~/config_files/.tmux.conf ~/.tmux.conf
```

For the `.vimrc` to work completely, download and install `vim-plug` [here](https://github.com/junegunn/vim-plug).

To set up the Iterm2 profile, in Iterm2, go to

    `Preferences` >
    `Profiles` >
    `Other Actions...` >
    `Import JSON Profiles...`

when prompted, select `palermo_iterm_profile.json` from this repo. Set the custom profile as the default profile.

