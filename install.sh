#!/bin/bash
# Call this from inside dotfiles directory

stow -D nvim
stow -D zsh
stow -D tmux
stow -D alacritty

stow nvim
stow zsh
stow tmux
stow alacritty
