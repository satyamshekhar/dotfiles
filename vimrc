set equalalways " make sure that windows always remain equal in size.
set incsearch hlsearch ignorecase smartcase " search related
set t_Co=256  " 256 color terminal
set wildmenu wildmode=longest,list,full  " better tab completion of file name
set backspace=indent,eol,start  " enable backspacing over everything
set ruler  " show line/column numbers
set showtabline=2  " show tabline at all times
set nowrap " disable soft/visual line wrapping
set cursorline colorcolumn=76
set list listchars=tab:\│\ ,trail:·
set list

colorscheme Light
syntax enable
hi CursorLine cterm=NONE ctermbg=Gray ctermfg=NONE
hi Visual cterm=NONE ctermbg=LightYellow

autocmd FileType * setlocal nonumber norelativenumber
autocmd FileType hpp setlocal number relativenumber
autocmd FileType cpp setlocal number relativenumber
autocmd FileType ipp setlocal number relativenumber
autocmd FileType java setlocal number relativenumber
set tabstop=2 shiftwidth=2 softtabstop=2 indentkeys=<Tab>
set hlsearch
set matchpairs+=<:>  " for matching c++ template brackets.

let mapleader=" "

" augroup numbertoggle
" :  autocmd!
" :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
" :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
