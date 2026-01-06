# config_files

Personal dotfiles for zsh, vim, tmux, and alacritty.

## Setup

1. Clone this repo to `~/config_files`

2. Create symbolic links to $HOME:
```
cd ~/config_files
sh create_symlinks.sh
```

3. Install oh-my-zsh plugins listed in `.zshrc` (clone repos into `~/.oh-my-zsh/plugins/`)

4. (Optional) Create `~/.secrets` for API keys and sensitive exports:
```
# ~/.secrets
export OPENAI_API_KEY="your-key-here"
```
This file is sourced by `.zshrc` if it exists, but never committed.

## What's Included

- `.zshrc` - zsh config with oh-my-zsh
- `.vimrc` - vim config (no plugins required, works on remote servers)
- `.alacritty.toml` - terminal emulator config
- `.tmux.conf` - tmux config
- `zsh_profiles/` - modular zsh configs (`.main`, `.work_only`)
