ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/boneyard
brew bundle
mv '/opt/homebrew-cask/Caskroom/google-chrome/latest/Google Chrome.app' /Applications/

git submodule update --init
cd ./.emacs.d/ && grunt
cd ../

ln -s ./zsh/.zshrc ~/.zshrc
ln -s ./zsh/.zshrc.local ~/.zshrc.local
ln -s ./zsh/.zshrc.osx ~/.zshrc.osx
ln -s ./tmux/.tmux.conf ~/.tmux.conf
ln -s ./.emacs.d ~/

cd karabiner && sh setting.sh 
