" ==========
" ENV INFO
" ==========
let s:darwin = has('mac')
let s:nvim   = has('nvim')
let s:ag     = executable('ag')

" ============================================================================
" VIM-PLUG BLOCK
" ============================================================================

silent! if plug#begin('~/.vim/plugged')

" Vim
Plug 'junegunn/vim-easy-align',       { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-after-object'

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
Plug 'marijnh/tern_for_vim'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'junegunn/rainbow_parentheses.vim'

  " Latex
  Plug 'LaTeX-Box-Team/LaTeX-Box'

  " Pandoc
  Plug 'vim-pandoc/vim-pandoc'

  " Webdev
  Plug 'mattn/emmet-vim'
  Plug 'groenewege/vim-less'
  Plug 'vim-stylus'

    " JS
    Plug 'jelera/vim-javascript-syntax'
    Plug 'pangloss/vim-javascript'
    Plug 'kchmck/vim-coffee-script'
    Plug 'mmalecki/vim-node.js'
    Plug 'nono/vim-handlebars'
    Plug 'moll/vim-node'
    Plug 'heavenshell/vim-jsdoc'

  " Haskell
  Plug 'wlangstroth/vim-haskell'

  " Arduino
  Plug 'Arduino-syntax-file'

  " Scala
  Plug 'rosstimson/scala-vim-support'
  
if s:darwin
  Plug 'Keithbsmiley/investigate.vim'
  Plug 'rizzatti/dash.vim'
  Plug 'junegunn/vim-xmark', { 'do': 'make' }
endif

call plug#end()
endif

" ============================================================================
" GLOBAL CONFIG BLOCK
" ============================================================================

let mapleader = ","
set clipboard=unnamed

" Escape with jj
inoremap jj <ESC>

" Edit config
nmap <leader>ec :e ~/.vimrc<CR>

" Source Config
nmap <leader>sc :source ~/.vimrc<CR>

" Delete Buffer
nmap <leader>db :b#<bar>bd#<CR>

" Next buf
nmap <leader>bn :bn<cr>
nmap <leader>bp :bp<cr>

" Quickfix
nmap <leader>cn :cnext<cr>
nmap <leader>cp :cprev<cr>

nmap <leader>ln :lnext<cr>
nmap <leader>lp :lprev<cr>

" Looks
set background=light
colorscheme solarized

set synmaxcol=2048

" Editing Config
set autoindent
set smartindent
set tabstop=3 softtabstop=4 shiftwidth=4 expandtab
set formatprg=par\ -w120

" Quick toggle
nmap <leader>i2 :set softtabstop=2 shiftwidth=2<cr>
nmap <leader>i4 :set softtabstop=4 shiftwidth=4<cr>

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

" =====================
" NEOVIM BLOCK
" =====================
if !s:nvim
  set nocompatible
else
  :tnoremap <A-h> <C-\><C-n><C-w>h
  :tnoremap <A-j> <C-\><C-n><C-w>j
  :tnoremap <A-k> <C-\><C-n><C-w>k
  :tnoremap <A-l> <C-\><C-n><C-w>l
  :nnoremap <A-h> <C-w>h
  :nnoremap <A-j> <C-w>j
  :nnoremap <A-k> <C-w>k
  :nnoremap <A-l> <C-w>l
endif

" =====================
" CURSOR BLOCK
" =====================
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
if has('mouse_sgr')
    set ttymouse=sgr
endif
set mouse=a

" =====================
" AUTOCMD BLOCK
" =====================
autocmd! BufWritePost * Neomake
autocmd BufRead,BufNewFile  *.lessimport set filetype=less
autocmd BufRead,BufNewFile  *.js set filetype=javascript
" autocmd BufRead,BufNewFile  *.md set filetype=pandoc.html
" autocmd BufWritePost more.md !pandoc --mathml -t html -Ss -o "more".html --css "more.css" "more.md" 
"
" ============================================================================
" PLUGIN CONFIG BLOCK
" ============================================================================
" =====================
" NEOMAKE BLOCK
" =====================
nmap <leader>lo :lopen<cr>
nmap <leader>m :Neomake<cr>
" let g:neomake_javascript_eslint_maker = {
"     \ 'args': ['--no-eslintrc', '-c', '~/repos/ecmas-styleguide/eslintrc-es6x', '-f', 'compact'],
"     \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
"     \ '%W%f: line %l\, col %c\, Warning - %m'
" \ }
" let g:neomake_javascript_enabled_makers = ['eslint']

" =====================
" NERDTREE BLOCK
" =====================

let NERDTreeHijackNetrw=1
nmap <leader>E :NERDTreeToggle<cr>

" =====================
" AIRLINE BLOCK
" =====================
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
" let g:airline#extensions#syntastic#enabled = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#excludes = ['-MiniBufExplorer-']

let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamecollapse = 1

set laststatus=2

" =====================
" VDEBUG BLOCK
" =====================

let g:vdebug_options = {}
let g:vdebug_options["port"] = 9000
let g:vdebug_options['path_maps'] = {"/var/www/git-repos/cs": "/Users/evan.simmons/repos/cs"}
let g:vdebug_options['server'] = ""

" =====================
" TCOMMENT BLOCK
" =====================

nmap <leader>/ :TComment<cr>
vnoremap <leader>/ :TComment<cr>

" =====================
" LATEX BLOCK
" =====================

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

" =====================
" GUNDO BLOCK
" =====================
nmap <leader>gu :GundoToggle<cr>
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" =====================
" MISC BLOCK
" =====================
let g:ag_format="%f:%l:%m"

nmap <leader>R :RainbowParenthesesToggle<cr>

" =====================
" SYNTASTIC BLOCK
" =====================
" let g:syntastic_javascript_checkers = ['eslint']
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_wq = 1
"
" nmap <leader>sr :SyntasticReset<cr>
" nmap <leader>sc :SyntasticCheck<cr>
" nmap <leader>sr :SyntasticReset<cr> :set list!<cr> "quiet

" =====================
" DASH BLOCK
" =====================

nmap <silent> <leader>ds <Plug>DashSearch
nmap <silent> <leader>dgs <Plug>DashSearch

" =====================
" ESFORMATTER BLOCK
" =====================

vnoremap <silent> <leader>es :! esformatter<CR>
nnoremap <silent> <leader>es :%!esformatter<CR>

" =====================
" COLEMAK BLOCK
" =====================

" noremap n j|noremap <C-w>n <C-w>j|noremap <C-w><C-n> <C-w>j
" noremap e k|noremap <C-w>e <C-w>k|noremap <C-w><C-e> <C-w>k
" noremap s h
" noremap t l
"
" noremap f e
" noremap k n
" noremap K N
" noremap U <C-r>

" =====================
" DIGRAPHS BLOCK
" =====================

digraph cm 8984 "⌘
digraph sh 8679 "⇧
digraph rt 8617 "↩
digraph bs 9003 "⌫
digraph al 8997 "⌥
digraph dl 8998 "⌦

" =====================
" TODO BLOCK
" =====================
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <silent><leader>n :set rnu! rnu? <cr>
set relativenumber
nnoremap <leader>w :w<cr>
