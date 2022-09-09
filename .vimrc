" basic settings
execute pathogen#infect()
syntax on
filetype plugin indent on
set number
set hls
set expandtab
set shiftwidth=2
set softtabstop=2
set spelllang=en
set textwidth=72
set encoding=utf-8
set visualbell  " really only matters in non-GUI environments
set ttimeoutlen=100
set wildmode=longest,list  " better tab completion
set nojoinspaces  " use one space after periods when auto-reformatting
colorscheme nord

" language-specific settings
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType tex setlocal spell
autocmd FileType make setlocal noexpandtab
autocmd BufRead,BufNewFile *.html set filetype=html
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufNewFile,BufRead /tmp/mutt-* set fo+=aw filetype=mail

let maplocalleader="\<space>"

" override Python indentation for Nexedi code
autocmd BufNewFile,BufRead /home/eric/nexedi/* set shiftwidth=2 softtabstop=2

" vimwiki setup
let g:vimwiki_root = $HOME . '/wiki'
let g:vimwiki_list = [{'path': $HOME . '/wiki',
      \                'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0
let g:vimwiki_folding = 'expr'

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

" fix math synatx highlighting
" see also
" https://stackoverflow.com/questions/32865744/vim-syntax-and-latex-math-inside-markdown
" https://github.com/vim-pandoc/vim-pandoc
let g:vim_markdown_math = 1

" disable Syntastic
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': []}

" utility functions
function Trim()
  %s/\s\+$//e
endfunction

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## cfb8a4e691791b99df70d06392a363c0 ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/home/eric/.opam/default/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
