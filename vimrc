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

" TypeScript: typecheck avec tsc + indent 2 espaces
augroup ts_settings
  autocmd!
  autocmd BufEnter *.ts,*.tsx,*.js,*.jsx setlocal makeprg=npx\ tsc\ --noEmit\ --skipLibCheck
  autocmd BufEnter *.ts,*.tsx,*.js,*.jsx setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
augroup END

nnoremap <leader>c :make<CR>

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

" ============================================================================
" TypeScript LSP - Uniquement pour Neovim
" ============================================================================

if has('nvim')
    lua << EOF
    -- Désactiver complètement les diagnostics (pas d'erreurs/warnings affichées)
    vim.diagnostic.config({
        virtual_text = false,
        signs = false,
        underline = false,
        update_in_insert = false,
        severity_sort = false,
    })
    -- Ignorer les diagnostics du serveur
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
    
    -- Keymaps LSP uniquement
    local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    end
    
    -- Configurer le LSP TypeScript
    if vim.lsp.config then
        vim.lsp.config.ts_ls = {
            cmd = { 'typescript-language-server', '--stdio' },
            filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
            root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
            on_attach = on_attach,
        }
        vim.lsp.enable('ts_ls')
    else
        local ok, lspconfig = pcall(require, 'lspconfig')
        if ok then
            lspconfig.ts_ls.setup({ on_attach = on_attach })
        end
    end
EOF
endif
