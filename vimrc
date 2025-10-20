if &term == 'xterm-kitty'
    let &t_ut=''
endif

packadd! gruvbox-material

let g:did_load_filetypes = 1
let g:did_load_ftplugin = 1
let g:did_indent_on = 1

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'yuezk/vim-js'
Plug 'alexendregv/norminette-vim'
call plug#end()
let mapleader = " "

let $LANG='en'
set langmenu=en

nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>p :bp!<CR>
nnoremap <leader>n :bn!<CR>
nnoremap <leader>d :bd!<CR>
nnoremap <leader>D :bp! \| bd!#<CR>
nnoremap <leader>q :q!<CR>:q!<CR>
nnoremap <leader>l :enew! \| setlocal buftype=nofile \| r !git ls-files <CR>
nnoremap <leader>t :enew! \| setlocal buftype=nofile  \| r !

set path+=**
set mouse=a
set number
set showcmd
set showmode
"set cursorline
set wildmenu

set relativenumber
set tabstop=4
set shiftwidth=4
set wrap
"set smartindent
"set cindent

set ignorecase
set smartcase
set incsearch
set hlsearch

set nobackup
set nowritebackup
set noswapfile

set lazyredraw
set ttyfast

set termguicolors
set background=dark
set clipboard=unnamedplus
set nohlsearch
set noerrorbells
set visualbell
set t_vb=
set formatoptions-=cro

let g:netrw_bufsettings = 'rnu'
"let g:netrw_banner = 0
"let g:netrw_liststyle = 0
"let g:netrw_browse_split = 0
"let g:netrw_winsize = 25

"" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material

highlight! link IncSearch Visual
autocmd ColorScheme * highlight! link IncSearch Visual
highlight! link Search Visual
