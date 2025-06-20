#!/bin/bash

TOOLS_DIR="/tools"

# Checking if /tools directory exists
if [ -d "$TOOLS_DIR" ]; then
    echo "Tools directory exists - skipping creation."
else
    echo "Creating tools directory..."
    mkdir /tools
fi

# Checking if git is installed
if ! command -v git >/dev/null 2>&1
then
    echo "git is not installed. Please install and git and run this script again."
    exit 1
fi

cd /tools
git clone https://github.com/zsh-users/zsh-syntax-highlighting
cd ~

# Settings up .zshrc dotfile
echo "HISTFILE=~/.config/.histfile" >> ~/.zshrc
echo "HISTSIZE=1000" >> ~/.zshrc
echo "SAVEHIST=10000" >> ~/.zshrc
echo "setopt autocd" >> ~/.zshrc
echo "PROMPT="%F{7}[%f%F{14}%n%f@%F{208}%~%f%F{7}]%f "" >> ~/.zshrc
# Custom aliases
echo "alias x='exit'" >> ~/.zshrc
echo "alias ll='ls -lah'" >> ~/.zshrc
# Setting up zsh syntax highlighting
echo "source /tools/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
