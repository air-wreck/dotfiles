" basic settings
execute pathogen#infect()
syntax on
filetype plugin indent on
set number
set expandtab
set shiftwidth=2
set softtabstop=2
set spelllang=en
set encoding=utf-8
set visualbell  " really only matters in non-GUI environments
set ttimeoutlen=100
set wildmode=longest,list  " better tab completion
colorscheme seti

" language-specific settings
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType tex setlocal spell
autocmd FileType make setlocal noexpandtab

" airline pretty stuff
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ' '

" utility functions
function Trim()
  %s/\s\+$//e
endfunction

