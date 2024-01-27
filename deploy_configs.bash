#!/bin/bash

# Deploy nvim configs to standard location
ln -s $(realpath $(dirname $0))/nvim ~/.config/

rm ~/.zshrc
ln -s $(realpath $(dirname $0))/zsh/.zshrc ~/

#echo $(realpath $(dirname $0))
