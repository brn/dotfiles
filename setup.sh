#!/bin/sh

## -Author- Taketoshi Aono
## BSD

## Setup homebrew itself.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## Install 'brew bundle' command.
brew tap homebrew/boneyard

## Install all bundles.
brew bundle

## Google Chrome which installed from 'brew cask' is not support 1Passowrd,
## to enable it, move an App file that located at user local 'Applications' to the global 'Applications' directory.
mv '/opt/homebrew-cask/Caskroom/google-chrome/latest/Google Chrome.app' /Applications/

## Update all submodules.
git submodule update --init

## Compile all Emacs lisp
cd ./.emacs.d/ && grunt
cd ../

## Create the symbolic links for all configuration files.
ln -s ./zsh/.zshrc ~/.zshrc
ln -s ./zsh/.zshrc.local ~/.zshrc.local
ln -s ./zsh/.zshrc.osx ~/.zshrc.osx
ln -s ./tmux/.tmux.conf ~/.tmux.conf
ln -s ./.emacs.d ~/

## Setup karabiner.
cd karabiner && sh setting.sh 
