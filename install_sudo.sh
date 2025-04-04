#!/bin/bash
# Call this as sudo

stow -D greetd -t /
stow -D udev -t /

stow greetd -t /
stow udev -t /
