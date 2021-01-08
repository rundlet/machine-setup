#!/bin/bash

# Brew 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Standard dev tools
brew install git
brew install --cask iterm2
brew install --cask visual-studio-code

# Python and data tools
brew install python3
brew install graphviz

# Docker
brew update
brew install docker
brew install docker-machine
brew install docker-compose
brew install --cask virtualbox

# VSCode
# Open Visual Studio Code and press Command + Shift + P or F1 then type `Shell` in command palette now you are able to find this option like `Shell Command : Install code in PATH` from suggested list in command palette. Select that options.

# Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Get and install Powerline font from https://github.com/Lokaltog/powerline-fonts
# TODO: Can iterm configurations be automated?
mkdir -p ~/git/iterm2
cd ~/git/iterm2
git clone https://github.com/powerline/fonts
curl https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Solarized%20Dark%20-%20Patched.itermcolors > Solarized-Dark-Patched.itermcolors

# Open Terminal, then navigate to _Terminal Preferences > Profiles > Font_ and click the Change button to "Droid Sans Mono for Powerline"
# Add solarized dark theme
compaudit | xargs chmod g-w,o-w

# Add to .zshrc
cd ~/.oh-my-zsh/custom
code aliases.zsh

## TODO generate an alias file and function file
# alias ..="cd .."
# alias hs='history | grep'
# alias mkcd='foo(){ mkdir -p "$1"; cd "$1" }; foo '
# alias myip="curl http://ipecho.net/plain; echo"
# alias ohmyzsh-aliases="code ~/.oh-my-zsh/custom/aliases.zsh"
# alias ohmyzsh-functions="code ~/.oh-my-zsh/custom/functions.zsh"
# alias ohmyzsh="code ~/.oh-my-zsh"
# alias reload-zsh="source ~/.zshrc"
# alias zshconfig="code ~/.zshrc"
# code functions.zsh
# cll() { ls -AlhG "$@" | awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/\[rwx\]/)\*2^(8-i));if(k)printf(" %0o ",k);print}' | cut -c 1-5,21-; }
