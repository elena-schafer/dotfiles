#!/bin/bash
# Call this from inside dotfiles directory

stow -D nvim
stow -D zsh
stow -D tmux
stow -D alacritty
stow -D greetd -t /
stow -D hyfetch

stow nvim
stow zsh
stow tmux
stow alacritty
stow greetd -t /
stow hyfetch
