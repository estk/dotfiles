set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'rking/ag.vim'
Bundle 'bling/vim-airline'
Bundle 'nono/vim-handlebars'
Bundle 'groenewege/vim-less'
Bundle 'tomtom/tcomment_vim'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'telamon/vim-color-github'
Bundle 'mmalecki/vim-node.js'
Bundle 'pangloss/vim-javascript'
Bundle 'wlangstroth/vim-haskell'
Bundle 'nono/vim-handlebars'
Bundle 'tpope/vim-git'
Bundle 'kchmck/vim-coffee-script'
Bundle 'rosstimson/scala-vim-support'
Bundle 'vim-scripts/Arduino-syntax-file'
Bundle 'tpope/vim-surround'
Bundle 'wincent/Command-T'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'sjl/gundo.vim'
Bundle 'kien/rainbow_parentheses.vim'

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'molokai'
Bundle 'vim-stylus'

filetype plugin indent on     " required!

let NERDTreeHijackNetrw=1

syntax enable
set background=light
colorscheme solarized

set anti
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h12
set laststatus=2
set autoindent
set tabstop=4 softtabstop=2 shiftwidth=2 expandtab
set wildmenu
set wildmode=longest:full,full
set hlsearch

let mapleader = ","
let g:airline_powerline_fonts = 1

nmap <D-F> :Ag 
nmap <leader>f :Ag 
nmap <leader>t :AgFile 

nmap <D-E> :NERDTreeTabsToggle<cr>
imap <D-E> <esc>:NERDTreeTabsToggle<cr>
nmap <leader>E :NERDTreeTabsToggle<cr>

nmap <leader>e :FufBuffer 
nmap <D-e> :FufBuffer 
imap <D-e> <esc>:FufBuffer 

nmap <leader>/ :TComment<cr>
nmap <D-/> :TComment<cr>
imap <D-/> <esc>:TComment<cr>

nmap <leader>R :RainbowParenthesesToggle<cr>

" Indent Mappings
imap <M-Tab> <esc>>>i
imap <M-S-Tab> <esc><<i

nmap <M-Tab> >>
nmap <M-S-Tab> <<

vmap <M-Tab> >gv
vmap <M-S-Tab> <gv


autocmd BufRead,BufNewFile  *.lessimport set filetype=less

au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
