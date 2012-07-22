" .vimrc
" by: Thomas Scrace <tom@scrace.org>

set nocompatible                    " don't worry about being vi compatible

" enable pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set modelines=0                     " fix security vulnerability
set tabstop=4                       " tab characters count for 4 columns
set shiftwidth=4                    " indent operations move text 4 columns
set softtabstop=4                   " how many cols to use when hitting tab
set expandtab                       " insert spaces when hitting tab
set encoding=utf-8
set scrolloff=5                     " we get 5 lines of context for searches
set autoindent                      " newlines start at same indent as prev
set showmode                        " display current mode bottom left
set showcmd                         " show command at bottom of screen
set hidden                          " hide buffers instead of closing them
set wildmenu
set wildmode=list:longest           " make command completion sane
set visualbell                      " flash instead of alert sound
set cursorline                      " highlight the cursor's current line
set ttyfast                         " make screen redrawing faster
set ruler                           " show ROW, COL of cursor bottom right
set backspace=indent,eol,start      " make backspacing work
set laststatus=2                    " always show the status line
set relativenumber                  " line numbers are relative to the cursor
set undofile                        " undos persist across sessions
set wrap                            " softwrap lines wider than the window
set textwidth=79                    " maximum width of line
set formatoptions+=q                " allow formatting of comments with gq
set formatoptions+=r                " auto-insert comment leader after enter
set formatoptions+=n                " recognise numbered lists when formatting
set formatoptions+=1                " don't break lines after 1-letter words
set colorcolumn=79                  " highlight column 79
set ignorecase                      " iff we search on an all-lowercase ...
set smartcase                       " ... string we are case-insensitive
set gdefault                        " apply substitutions globally by default
set incsearch                       " highlight
set showmatch                       "          search results
set hlsearch                        "                        as we type

let mapleader = ','                 " remap leader key to ,

" auto-insert \v before search terms to be compatible with Python regex
nnoremap / /\v
vnoremap / /\v

"clear out searches using ,<space>
nnoremap <leader><space> :noh<cr>

"tab key matches to bracket pairs in normal and visual modes
nnoremap <tab> %
vnoremap <tab> %

" disable the cursor keys in normal and insert modes
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"j and k operate across visual, rather than logical lines
nnoremap j gj
nnoremap k gk

" ctrl-h/j/k/l to move around splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set t_Co=256                        " force 256 colours
syntax on                           " syntax highlighting
set background=dark                 " use colours for dark background
colorscheme molokai                 " use the molokai colour scheme

" ,W strips all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" ,q re-hardwraps paragraphs of text
nnoremap <leader>q gqip

" ,v selects the text that was just pasted into a buffer
nnoremap <leader>v V`]

" ,w opens a new vertical split and switches to it
nnoremap <leader>w <C-w>v<C-w>l
