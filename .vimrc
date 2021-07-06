" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" Do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

set autoindent
set smartindent
set expandtab " replace tab by spaces
set tabstop=4  " TAB width
set shiftwidth=4  " Indents width
set softtabstop=4  " TAB column number
set undofile
set number relativenumber
set showmatch   " Show matching brackets
set incsearch   " reql time search
filetype plugin indent on
set updatetime=750
set encoding=utf-8
let mapleader=" "
" Enable autocompletion:
set wildmode=longest,list,full
" Disable automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set splitbelow splitright

" Set color for spellcheck
hi SpellBad ctermfg=red guifg=red

" Make scrolling workable in st
if &term =~ '^st\($\|-\)'
	set ttymouse=sgr
endif

" Easier navigation in split mode (ctrl+nav keys)
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

call plug#begin()
" Color themes & appearance
 Plug 'ap/vim-css-color'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 " Cursor shapes
 Plug 'wincent/terminus'
 " Focus mode
 Plug 'junegunn/goyo.vim'
 Plug 'junegunn/limelight.vim'
 " Access to sys clipboard & fuzzer + emojis
 Plug 'christoomey/vim-system-copy'
 Plug 'junegunn/fzf.vim', {'do': { -> fzf#install() } }
 Plug 'yazgoo/unicodemoji'
 " Clear spaces & comments
 Plug 'ntpeters/vim-better-whitespace'
 Plug 'tpope/vim-commentary'
 " Discord rich presence
 Plug 'hugolgst/vimsence'
 " Coding facilities
 Plug 'airblade/vim-gitgutter'
 Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
 Plug 'tpope/vim-surround'
" rmarkdown related
 Plug 'vim-pandoc/vim-rmarkdown'
 Plug 'vim-pandoc/vim-pandoc'
 Plug 'vim-pandoc/vim-pandoc-syntax'
call plug#end()

" Footer theme
let g:airline_theme='luna'
let g:airline_powerline_fonts=1

" Goyo display
map <Leader>g :Goyo \| set linebreak<CR>
" Light focus for goyo
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Proper paste
set pastetoggle=<F3>
" Copy/paste widely
vnoremap <C-c> "+y
nnoremap <C-v> <F3>"+p<F3>
inoremap <C-v> <Esc><F3>"+p<F3>
vnoremap <C-v> <F3>"+p<F3>

" Edit vimrc
map <leader>v :edit $MYVIMRC<CR>
" Posix compliant check
map <leader>b :!clear && shellcheck %<CR>
" Insert emoji with fzf
map <leader>e :Unicodemoji<CR>
" Strip whitespace
map <leader>sw :StripWhitespace<CR>
" Detect file type for comments
autocmd FileType apache setlocal commentstring=#\ %s
" Insert line of hashtags
map <leader>c 80A#<Esc>d80<bar>
" Recompile st automatically
autocmd BufWritePost config.def.h !doas make install
" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>l :w! \| !compiler <c-r>%<CR>
" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>
" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufRead,BufNewFile xresources,xdefaults set filetype=xdefaults
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Cursor shapes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Save file w/o root permissions
cnoremap w!! execute 'silent! write !doas tee % >/dev/null' <bar> edit!
