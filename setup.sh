#!/bin/sh
# okay, I lied...this is mostly Debian-centric

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

### latex
if ! [ -x "$(command -v latex)" ]; then
  # is it safe to assume that latex == texlive-full?
  echo "No latex detected. Installing now. This may take a while."
  sudo apt-get install texlive-full
fi

### atom
if ! [ -x "$(command -v atom)" ]; then
  echo "No atom detected. Installing now."
  wget https://atom.io/download/deb -O atom-amd64.deb
  sudo dpkg -i atom-amd64.deb
  sudo apt-get -f install
  rm atom-amd64.deb
fi
./atom-setup.sh  # use separate file to reduce OS-specific stuff

### vim
./vim-setup.sh

# set installed flag and exit
touch ~/.air-wreck-dotfiles-flag
echo 'Finished with dotfiles installation.'
