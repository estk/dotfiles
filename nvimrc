set nocompatible              " be iMproved, required
filetype off                  " required

let s:darwin = has('mac')
let s:ag     = executable('ag')

" ============================================================================
" NEOVIM
" ============================================================================
" global stuffs
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set clipboard=unnamed

if has('mouse_sgr')
    set ttymouse=sgr
endif
set mouse=a

autocmd! BufWritePost * Neomake

" ============================================================================
" VIM-PLUG BLOCK
" ============================================================================

silent! if plug#begin('~/.nvim/plugged')

" Vim
Plug 'junegunn/vim-easy-align',       { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-after-object'

if s:darwin
Plug 'junegunn/vim-xmark', { 'do': 'make' }
endif

" Neovim
Plug 'benekastah/neomake'
Plug 'bruno-/vim-man'


" Airline
Plug 'bling/vim-airline'

  Plug 'edkolev/promptline.vim'
  Plug 'edkolev/tmuxline.vim'

" Code
Plug 'rking/ag.vim'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'joonty/vdebug'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv', { 'on': 'Gitv' }
Plug 'mattn/gist-vim'

" Tmux
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-dispatch'

" Util

Plug 'tpope/vim-unimpaired'
Plug 'Lokaltog/vim-easymotion'
Plug 'tomtom/tcomment_vim'
Plug 'wincent/Command-T'
Plug 'tpope/vim-commentary',        { 'on': '<Plug>Commentary' }
Plug 'mbbill/undotree',             { 'on': 'UndotreeToggle'   }
Plug 'fholgado/minibufexpl.vim'
Plug 'wannesm/rmvim.vim'
Plug 'Townk/vim-autoclose'
Plug 'LargeFile'
Plug 'BufOnly.vim'


" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'telamon/vim-color-github'
Plug 'nathanaelkane/vim-indent-guides'


" Syntax
" Plug 'scrooloose/syntastic'
Plug 'marijnh/tern_for_vim'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'junegunn/rainbow_parentheses.vim'

  " Latex
  Plug 'LaTeX-Box-Team/LaTeX-Box'

  " Pandoc
  Plug 'vim-pandoc/vim-pandoc'

  " Webdev
  Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
  Plug 'groenewege/vim-less'
  Plug 'vim-stylus'

    " JS
    Plug 'jelera/vim-javascript-syntax'
    Plug 'pangloss/vim-javascript'
    Plug 'kchmck/vim-coffee-script'
    Plug 'mmalecki/vim-node.js'
    Plug 'nono/vim-handlebars'
    Plug 'moll/vim-node'

  " Haskell
  Plug 'wlangstroth/vim-haskell'

  " Arduino
  Plug 'Arduino-syntax-file'

  " Scala
  Plug 'rosstimson/scala-vim-support'
  
if s:darwin
  Plug 'Keithbsmiley/investigate.vim'
  Plug 'rizzatti/dash.vim'
endif

call plug#end()
endif

" ==== General ====
set binary
filetype plugin indent on
syntax enable
nmap <leader>d :b#<bar>bd#<CR>
nmap <leader>cn :cnext<cr>
nmap <leader>cp :cprev<cr>

nmap <leader>ln :lnext<cr>
nmap <leader>lp :lprev<cr>

" Looks
set background=light
colorscheme solarized

set t_Co=256
set anti

let mapleader = ","

" Plug Config

  " Nerdtree
  let NERDTreeHijackNetrw=1

  nmap <D-E> :NERDTreeToggle<cr>
  imap <D-E> <esc>:NERDTreeToggle<cr>
  nmap <leader>E :NERDTreeToggle<cr>


  " Airline
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#syntastic#enabled = 1

  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#tab_min_count = 2
  let g:airline#extensions#tabline#excludes = ['-MiniBufExplorer-']

  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#tabline#fnamecollapse = 1

  set laststatus=2

  " Code
  let g:vdebug_options = {}
  let g:vdebug_options["port"] = 9000
  let g:vdebug_options['path_maps'] = {"/var/www/git-repos/cs": "/Users/evan.simmons/repos/cs"}
  let g:vdebug_options['server'] = ""

  let g:ag_format="%f:%l:%m"

  " JS
  let g:javascript_conceal = 1

  " Comment
  nmap <leader>/ :TComment<cr>
  nmap <D-/> :TComment<cr>
  imap <D-/> <esc>:TComment<cr>
  vmap <D-/> :TComment<cr> gv
  vmap <leader>/ :TComment<cr>

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
  set undodir=$HOME/.nvim/undo " where to save undo histories
  set undolevels=1000         " How many undos
  set undoreload=10000        " number of lines to save for undo

  " Rainbow
  nmap <leader>R :RainbowParenthesesToggle<cr>

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
  nmap <leader>t :FZF<cr>

  " View
  set list
  set conceallevel=1
  set concealcursor="nc"
  set number
  set hidden
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
" autocmd BufRead,BufNewFile  *.md set filetype=pandoc.html
autocmd BufRead,BufNewFile  *.js set filetype=javascript
" autocmd BufWritePost more.md !pandoc --mathml -t html -Ss -o "more".html --css "more.css" "more.md" 


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
