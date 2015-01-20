ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
sudo brew bundle

git submodule update --init

ln -s ./zsh/.zshrc ~/.zshrc
ln -s ./zsh/.zshrc.local ~/.zshrc.local
ln -s ./zsh/.zshrc.osx ~/.zshrc.osx
ln -s ./tmux/.tmux.conf ~/.tmux.conf
ln -s ./.emacs ~/


