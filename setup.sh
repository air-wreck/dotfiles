#!/bin/sh
# this file contains miscellaneous setup stuff
# you should comment/uncomment sections as appropriate

# check if this system already has dotfiles
if [ -f ~/.air-wreck-dotfiles-flag ]; then
  echo 'Warning: detected existing dotfiles installation.'
  echo -n 'Continue? (y/N) '
  read -r REPLY
  if ! [ "$REPLY" = Y ] && ! [ "$REPLY" = y ]; then
    echo 'Install terminated by user'
    exit 0
  fi
else
  echo 'Fresh install detected.'
fi
echo 'Beginning dotfiles install...'

# use sudo for installs
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

### add my last name to the dictionary, because it's annoying when spellcheck
### marks it as wrong (I'm not sure if Atom+Vim respect this...)
echo 'Zheng' | sudo tee --append /usr/share/dict/words > /dev/null

### disable the annoying bell
sudo sed -i 's/# set bell-style none/set bell-style none/' /etc/inputrc

### set GPG et al. to use non-GUI passphrase entry
### on a fresh system, may need do first install pinentry-tty
sudo update-alternatives --config pinentry

### vim ###
#
# you likely do not need to manually install vim stuff because it's all
# in this repository already, but just in case, you can uncomment this section
#
# # install pathogen for plugins
# mkdir -p ~/.vim/autoload ~/.vim/bundle
# curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
#
# # install vim bundles (if you did not clone with --recuse-submodules)
# git submodule init
# git submodule update

### tmux ###
sudo apt-get install tmux

### latex ###
#
# this is commented by default because installing LaTeX is not desirable
# on many systems
#
# sudo apt-get install texlive-full

### Debian packages ###
#
# this is a worst-case reinstall of every manually installed Debian package
# that I have; it should probably not be run out-of-the-box
# manual-list is just the output of `apt-mark showmanual`
#
# sudo apt-get install $(grep -vE "^\s*#" manual-list | tr "\n" " ")

# set installed flag and exit
touch ~/.air-wreck-dotfiles-flag
echo 'Finished with dotfiles installation.'

