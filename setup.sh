#!/bin/sh

## -Author- Taketoshi Aono
## BSD

## Setup homebrew itself.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## In the first, install git for the other modules.
brew install git

## Install 'brew bundle' command.
brew tap homebrew/boneyard
## Load font.
brew tap caskroom/fonts
## Load java
brew tap caskroom/versions

## Install all bundles.
brew bundle

## Google Chrome which installed from 'brew cask' is not support 1Passowrd,
## to enable it, move an App file that located at user local 'Applications' to the global 'Applications' directory.
mv '/opt/homebrew-cask/Caskroom/google-chrome/latest/Google Chrome.app' /Applications/

## Update all submodules.
git submodule update --init

## Compile all Emacs lisp
cd ./.emacs.d/ && npm install && grunt
cd ../

## Install perl libraries.
cpan RPC::EPC::Service DBI DBD::SQLite DBD::Pg DBD::mysql

## Create the symbolic links for all configuration files.
ln -s ./zsh/.zshrc ~/.zshrc
ln -s ./zsh/.zshrc.local ~/.zshrc.local
ln -s ./zsh/.zshrc.osx ~/.zshrc.osx
ln -s ./tmux/.tmux.conf ~/.tmux.conf
ln -s ./.emacs.d ~/

## Setup karabiner.
# cd karabiner && sh setting.sh 

## Setup rust(1.0.0)
cd rust && sh setup.sh
