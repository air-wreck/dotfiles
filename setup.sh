#!/bin/sh
# okay, I lied...this is mostly Debian-centric
echo 'Beginning dotfiles install...'

# use sudo for installs
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

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

echo 'Finished with dotfiles installation.'
