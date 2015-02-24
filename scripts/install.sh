#!/usr/bin/env bash

echo "\033[0;32m                                            \033[0m"
echo "\033[0;32m   **************************************** \033[0m"
echo "\033[0;32m   *      Bodhi5: Machine Provisioner     * \033[0m"
echo "\033[0;32m   **************************************** \033[0m"
echo "\033[0;32m                                            \033[0m"



echo "\033[0;34mCloning .Dotfiles...\033[0m"
hash git >/dev/null && /usr/bin/env git clone https://bitbucket.org/bodhi5/dotfiles.git ~/.dotfiles || {
  echo "git not installed"
  exit
}

# enter scripts dir
cd ~/.dotfiles/scripts

# allow execution
chmod +x setup.sh dev.sh apps.sh fonts.sh link.sh update.sh

echo "\033[0;34mCreating Symlinks\033[0m"
./link.sh

echo "\033[0;34mRunning Base Setup\033[0m"
./setup.sh

echo "\033[0;34mInstalling Dev Tools\033[0m"
./dev.sh

echo "\033[0;34mInstalling Fonts\033[0m"
./fonts.sh

echo "\033[0;34mFinishing Up...\033[0m"
./link.sh

# return to starting dir
cd -
