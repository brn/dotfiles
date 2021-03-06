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

## Install nodejs
nodebrew install-binary latest

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
CWD=$(pwd)
pushd ~/
mkdir -p .tmux/plugins
ln -s ${CWD}/zsh/.zshrc
ln -s ${CWD}/zsh/.zshrc.local
ln -s ${CWD}/zsh/.zshrc.osx
ln -s ${CWD}/tmux/.tmux.conf
ln -s ${CWD}/.emacs.d

cd .tmux/plugins
ln -s ${CWD}/tmux/tpm

popd

## Setup karabiner.
# cd karabiner && sh setting.sh 

## Setup rust(1.0.0)
cd rust && sh setup.sh
