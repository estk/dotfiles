set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


" Vim
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-surround'

" Airline
Plugin 'bling/vim-airline'

  Plugin 'edkolev/promptline.vim'
  Plugin 'edkolev/tmuxline.vim'

" Code
Plugin 'rking/ag.vim'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'

" Util

Plugin 'tpope/vim-unimpaired'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tomtom/tcomment_vim'
Plugin 'wincent/Command-T'
Plugin 'mbbill/undotree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'wannesm/rmvim.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'LargeFile'
Plugin 'BufOnly.vim'


" Themes
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'telamon/vim-color-github'
Plugin 'molokai'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'xoria256.vim'
Plugin 'Pychimp/vim-luna'


" Syntax
Plugin 'scrooloose/syntastic'
Plugin 'marijnh/tern_for_vim'
Plugin 'kien/rainbow_parentheses.vim'
" Plugin 'Raimondi/delimitMate'
Plugin 'jiangmiao/auto-pairs.git'
" Plugin 'honza/vim-snippets'
Plugin 'godlygeek/tabular'

  " Latex
  Plugin 'LaTeX-Box-Team/LaTeX-Box'

  " Pandoc
  Plugin 'vim-pandoc/vim-pandoc'

  " Webdev
  Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
  Plugin 'groenewege/vim-less'
  Plugin 'vim-stylus'

    " JS
    Plugin 'jelera/vim-javascript-syntax'
    Plugin 'pangloss/vim-javascript'
    Plugin 'kchmck/vim-coffee-script'
    Plugin 'mmalecki/vim-node.js'
    Plugin 'nono/vim-handlebars'
    Plugin 'moll/vim-node'

  " Haskell
  Plugin 'wlangstroth/vim-haskell'

  " Arduino
  Plugin 'Arduino-syntax-file'

  " Scala
  Plugin 'rosstimson/scala-vim-support'

call vundle#end()

" ==== General ====

set nocompatible               " be iMproved
set binary
filetype plugin indent on
syntax enable

nmap <leader>cn :cnext<cr>
nmap <leader>cp :cprev<cr>

nmap <leader>ln :lnext<cr>
nmap <leader>lp :lprev<cr>

" Looks
set background=dark
colorscheme solarized
if has("gui_running")
    set transparency=5
endif

set t_Co=256
set anti
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h13

let mapleader = ","

" Plugin Config

  " Nerdtree
  let NERDTreeHijackNetrw=1
  let g:nerdtree_tabs_open_on_gui_startup=0

  nmap <D-E> :NERDTreeTabsToggle<cr>
  imap <D-E> <esc>:NERDTreeTabsToggle<cr>
  nmap <leader>E :NERDTreeTabsToggle<cr>


  " Airline
  let g:airline_powerline_fonts = 1
  let g:airline_enable_branch     = 1
  let g:airline_enable_syntastic  = 1

  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#tab_min_count = 2
  let g:airline#extensions#tabline#excludes = ['-MiniBufExplorer-']

  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#tabline#fnamecollapse = 1
  
  

  set laststatus=2

  " JS
  let g:javascript_conceal = 1

  " Comment
  nmap <leader>/ :TComment<cr>
  nmap <D-/> :TComment<cr>
  imap <D-/> <esc>:TComment<cr>
  vmap <D-/> :TComment<cr> gv

  "Latex
  let g:LatexBox_viewer="open -a skim"
  let g:LatexBox_latexmk_preview_continuously=1
  let g:LatexBox_quickfix=1
  let g:LatexBox_show_warnings=0
  let g:LatexBox_latexmk_async=1

  nmap <leader>ll :Latexmk<cr>
  nmap <leader>lv :LatexView<cr>
  nmap <leader>lc :LatexmkClean<cr>
  nmap <leader>le :LatexErrors<cr>
  nmap <leader>ls :LatexmkStop<cr>

  " Gundo
  nmap <leader>gu :GundoToggle<cr>
  set undofile                " Save undo's after file closes
  set undodir=$HOME/.vim/undo " where to save undo histories
  set undolevels=1000         " How many undos
  set undoreload=10000        " number of lines to save for undo

  " Rainbow
  nmap <leader>R :RainbowParenthesesToggle<cr>

  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces


" Editing Config
set autoindent
set smartindent
set tabstop=4 softtabstop=2 shiftwidth=2 expandtab
set formatprg=par
" Reselect pasted text
nnoremap gp `[v`]

  " Completion
  set wildmenu
  set wildmode=longest:full,full

  " Search
  set ignorecase    " ignore case when searching
  set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
  set hlsearch      " highlight search terms
  set incsearch

  nmap <leader><space> :noh<cr>

  nnoremap / /\v
  vnoremap / /\v

  nmap <D-F> :Ag 
  nmap <leader>f :Ag 
  nmap <leader>t :AgFile 

  " View
  set list
  set conceallevel=1
  set concealcursor="nc"
  set number
  set hidden
  set ambiwidth=double
  set listchars=tab:▸\ ,eol:¬

  nmap <leader>l :set list!<CR> " Shortcut to rapidly toggle `set list`

  nmap <leader>s :SyntasticReset<cr> :set list!<cr> "quiet
  

  " Indent
  imap <M-Tab> <esc>>>i
  imap <M-S-Tab> <esc><<i

  nmap <M-Tab> >>
  nmap <M-S-Tab> <<

  vmap <M-Tab> >gv
  vmap <M-S-Tab> <gv


" Syntax
autocmd BufRead,BufNewFile  *.lessimport set filetype=less
autocmd BufRead,BufNewFile  *.md set filetype=pandoc.html
autocmd BufRead,BufNewFile  *.js set filetype=javascript
autocmd BufWritePost more.md !pandoc --mathml -t html -Ss -o "more".html --css "more.css" "more.md" 


" Digraphs
digraph cm 8984 "⌘
digraph sh 8679 "⇧
digraph rt 8617 "↩
digraph bs 9003 "⌫
digraph al 8997 "⌥
digraph dl 8998 "⌦


" ESFormatter
vnoremap <silent> <leader>es :! esformatter<CR>
nnoremap <silent> <leader>es :%!esformatter<CR>
