execute pathogen#infect()
syntax on
filetype plugin indent on
set number
set expandtab
set shiftwidth=2
set softtabstop=2
set spelllang=en
colorscheme seti

" language-specific settings
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType tex setlocal spell
autocmd FileType make setlocal noexpandtab

" utility functions
function Trim()
  %s/\s\+$//e
endfunction

