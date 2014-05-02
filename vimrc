" ==== Vundle ====
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'


" Vim
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
" Bundle 'duff/vim-scratch'
Bundle 'tpope/vim-surround'

" Airline
Bundle 'bling/vim-airline'

  Bundle "edkolev/promptline.vim"
  Bundle "edkolev/tmuxline.vim"

" Code
Bundle 'rking/ag.vim'

" Git
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'

" Util

Bundle "tpope/vim-unimpaired"
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tomtom/tcomment_vim'
Bundle 'wincent/Command-T'
Bundle 'mbbill/undotree'
Bundle 'fholgado/minibufexpl.vim'
Bundle "wannesm/rmvim.vim"
Bundle 'Townk/vim-autoclose'
Bundle 'LargeFile'
Bundle 'BufOnly.vim'


" Themes
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'telamon/vim-color-github'
Bundle 'molokai'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'xoria256.vim'
Bundle 'Pychimp/vim-luna'


" Syntax
Bundle 'scrooloose/syntastic'
Bundle 'marijnh/tern_for_vim'
Bundle 'kien/rainbow_parentheses.vim'
" Bundle 'Raimondi/delimitMate'
Bundle 'jiangmiao/auto-pairs.git'
" Bundle 'honza/vim-snippets'
Bundle 'godlygeek/tabular'

  " Latex
  Bundle 'LaTeX-Box-Team/LaTeX-Box'

  " Pandoc
  Bundle 'vim-pandoc/vim-pandoc'

  " Webdev
  Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
  Bundle 'groenewege/vim-less'
  Bundle 'vim-stylus'

    " JS
    Bundle 'jelera/vim-javascript-syntax'
    " Bundle 'pangloss/vim-javascript'
    Bundle 'kchmck/vim-coffee-script'
    Bundle 'mmalecki/vim-node.js'
    Bundle 'nono/vim-handlebars'
    Bundle 'moll/vim-node'

  " Haskell
  Bundle 'wlangstroth/vim-haskell'

  " Arduino
  Bundle 'Arduino-syntax-file'

  " Scala
  Bundle 'rosstimson/scala-vim-support'

  " Rust
  Bundle 'wting/rust.vim'


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


" Digraphs
digraph cm 8984 "⌘
digraph sh 8679 "⇧
digraph rt 8617 "↩
digraph bs 9003 "⌫
digraph al 8997 "⌥
digraph dl 8998 "⌦


" ESFormatter
nnoremap <silent> <leader>e :call JSFormat()<cr>
 
function! JSFormat()
" Preparation: save last search, and cursor position.
let l:win_view = winsaveview()
let l:last_search = getreg('/')
 
" call esformatter with the contents form and cleanup the extra newline
execute ":%!~/.vim/bin/js-format.sh"
if v:shell_error
echoerr 'format script failed'
undo
return 0
endif
" Clean up: restore previous search history, and cursor position
call winrestview(l:win_view)
call setreg('/', l:last_search)
endfunction
