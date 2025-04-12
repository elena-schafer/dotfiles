#!/bin/bash
# Call this from inside dotfiles directory

stow -D ags
stow -D alacritty
stow -D desktop-files
stow -D greetd -t /
stow -D hyfetch
stow -D hyperland
stow -D nvim
stow -D rofi
stow -D scripts
stow -D tmux
stow -D zsh
stow -D zk

# Register custom mime type for mixed md and tex notes
xdg-mime default zknote.desktop x-scheme-handler/zknote

stow ags
stow alacritty
stow desktop-files
stow greetd -t /
stow hyfetch
stow hyperland
stow nvim
stow rofi
stow scripts
stow tmux
stow zsh
stow zk
