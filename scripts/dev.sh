#!/bin/bash

#install kegs
brew install git zsh node tmux python go cmake watchman fswatch docker

# override system vim
brew install vim --env-std --override-system-vim

#install casks
brew tap phinze/homebrew-cask

# install differnet app version via casks
brew tap caskroom/versions

# install fonts via casks
brew tap caskroom/fonts

# update brews and casks
echo -e "\033[0;34mFetching latest homebrew formulas...\033[0m"
brew update
brew install brew-cask

# Install oh-my-zsh
# rm -rf ~/.oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# Install vim bundles for vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Own Node and NPM
sudo mkdir -p /usr/local/{share/man,bin,lib/node,lib/dtrace,include/node,lib/node_modules}
sudo chown -R $USER /usr/local/{share/man,bin,lib/node,lib/dtrace,include/node,lib/node_modules}

# Go Tools
go get go.bh5.co/serve
go get golang.org/x/tools/...

# Install modules
npm -g install eslint babel babel-eslint webpack

# Install Google Cloud SDK
curl https://sdk.cloud.google.com | zsh
