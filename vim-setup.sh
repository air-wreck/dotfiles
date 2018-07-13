#!/bin/bash

# install pathogen for plugins
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# seti theme
git clone https://github.com/trusktr/seti.vim ~/.vim/bundle/seti.vim

# polygot language pack
git clone https://github.com/sheerun/vim-polyglot.git ~/.vim/bundle/vim-polyglot.vim

cp vim-config.conf ~/.vimrc
