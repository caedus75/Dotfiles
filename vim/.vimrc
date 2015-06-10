" Plugins
" - airline-git
" - commentary
" - ednwise
" - fugitive
" - repeat
" - surround
" - syntastic

" Colorschemes
" - base16-git
" - colorschemes-noah

" User settings
" Terminal options
set t_Co=256

" Vim mode
set nocompatible

" Enable Syntax highlighting
syntax enable

" Set color scheme
set background=dark
let base16colorspace=256
colorscheme base16-chalk

" Numbered lines
set number

" 80 char a line, no more!
set textwidth=80
set formatoptions+=t

" Mark the column after textwidth
set colorcolumn=+1

" Automatically indent
set smartindent

" Tabs to 4 spaces
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

" Use UTF-8
set encoding=utf-8

" Search as you type, case insensitive and highlight
set incsearch
set ignorecase
"set hlsearch

" Highlight white spaces
set list
set listchars=trail:·,tab:»·

" Vim Airline
set laststatus=2
set ttimeoutlen=50

let g:airline_theme='base16'
let g:airline_powerline_fonts=0
let g:airline_left_sep=''
let g:airline_right_sep=''

let g:airline#extensions#tabline#enabled=1

let g:airline#extensions#branch#enabled=1
let g:airline#extensions#branch#empty_message=''

" Vim Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_wq=0

" C++14
let g:syntastic_cpp_compiler='g++'
let g:syntastic_cpp_compiler_options='-std=c++14'

" Vim LaTeXSuite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

" Maps
" Don't open command history
map q: :q

" Remove trailing spaces.
nnoremap <silent> <F10> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Toggle 'hex mode'
noremap <F9> :call HexMe()<CR>
let $in_hex=0
function HexMe()
    set binary
    set noeol
    if $in_hex>0
        :%!xxd -r
        let $in_hex=0
    else
        :%!xxd
        let $in_hex=1
    endif
endfunction
