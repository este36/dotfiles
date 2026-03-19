if &term == 'xterm-kitty'
    let &t_ut=''
endif

let g:syntastic_c_checkers = ['norminette', 'gcc']
let g:syntastic_aggregate_errors = 1
let g:syntastic_c_norminette_exec = 'norminette'

let g:user42 = 'emercier'
let g:mail42 = 'emercier@student.42lausanne.ch'

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

augroup go_makeprg
  autocmd!
  autocmd BufEnter *.go if findfile('go.mod', '.;') != '' | setlocal makeprg=go\ build\ . | endif
augroup END

set exrc
set secure

set path+=**
set mouse=a
set number
set showcmd
set showmode
set wildmenu

set relativenumber
set tabstop=4
set shiftwidth=4
set wrap
set smartindent

set ignorecase
set smartcase
set incsearch
set nohlsearch

set nobackup
set nowritebackup
set noswapfile

set lazyredraw
set ttyfast

set termguicolors
set background=dark
set clipboard=unnamedplus
set noerrorbells
set visualbell
set t_vb=
set formatoptions-=cro

let g:netrw_bufsettings = 'rnu'

let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material

highlight! link IncSearch Visual
autocmd ColorScheme * highlight! link IncSearch Visual
highlight! link Search Visual
