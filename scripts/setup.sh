#!/bin/bash

# Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# rvm & ruby
curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
rvm install ruby-2.1.2
rvm set ruby-2.1.2 --default

gem install cocoapods

# Create git creds file
if [ -f ~/.gitconfig_local ]
then
  echo -e "\033[0;32mFound ~/.gitconfig_local.\033[0m";
else
  echo -e "\033[0;33mNo ~/.gitconfig_local found. Generating one now...\033[0m";
  echo -e "[user]\n  name=\n  email=\n" > ~/.gitconfig_local
  echo -e "\033[0;32m~/.gitconfig_local created. Make sure to update after install completes.\033[0m";
fi

# Set OS X defaults
./osx
