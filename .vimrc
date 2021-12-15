so ~/dotfiles/plugins-vim.vim
set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set signcolumn=yes
set expandtab
set tabstop=2 shiftwidth=2
set sw=2
filetype plugin indent on
set list

set listchars=tab:→\ 
set listchars+=eol:↲
set listchars+=nbsp:␣
set listchars+=extends:❯,precedes:❮
set listchars+=trail:•
set showbreak=↪\

set relativenumber
colorscheme gruvbox
highlight CursorLine cterm=underline

set laststatus=2
set noshowmode

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set cmdheight=2

so ~/dotfiles/maps-vim.vim
so ~/dotfiles/pugin-config.vim
