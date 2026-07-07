if &term == 'xterm-kitty'
    let &t_ut=''
endif

let g:syntastic_c_checkers = ['norminette', 'gcc']
let g:syntastic_aggregate_errors = 1
let g:syntastic_c_norminette_exec = 'norminette'

let g:user42 = 'emercier'
let g:mail42 = 'emercier@student.42lausanne.ch'

let mapleader = " "

set langmenu=en_US.UTF-8
let $LANG = "en_US.UTF-8"
let $LC_ALL = "en_US.UTF-8"

nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>p :bp!<CR>
nnoremap <leader>n :bn!<CR>
nnoremap <leader>d :bd!<CR>
nnoremap <leader>D :bp! \| bd!#<CR>
nnoremap <leader>q :q!<CR>:q!<CR>
nnoremap <leader>l :enew! \| setlocal buftype=nofile \| r !git ls-files <CR>
nnoremap <leader>t :enew! \| setlocal buftype=nofile  \| r !
nnoremap <leader>e :Explore<CR>
nnoremap <leader>b :enew! \| setlocal buftype=nofile
nnoremap <leader>t :bo terminal<CR>
nnoremap <leader>c :make<CR>

:command! QuickfixBlock call s:QuickfixBlock()

function! s:QuickfixBlock()
  let l:lines = getline(1, '$')
  let l:entries = []
  for l in l:lines
    let l:parts = split(l, '[:]')
    if len(l:parts) < 2
      continue
    endif
    let l:file = l:parts[0]
    let l:line = str2nr(l:parts[1])
    let l:col = len(l:parts) > 2 ? str2nr(l:parts[2]) : 1
    call add(l:entries, {'filename': l:file, 'lnum': l:line, 'col': l:col, 'text': ''})
  endfor
  if !empty(l:entries)
    call setqflist(l:entries)
    copen
  endif
endfunction

command! -nargs=1 -complete=file Go call s:Go(<q-args>)

function! s:Go(arg)
  let l:parts = split(a:arg, ':')
  let l:file = l:parts[0]
  let l:line = len(l:parts) > 1 ? str2nr(l:parts[1]) : 1
  let l:col  = len(l:parts) > 2 ? str2nr(l:parts[2]) : 1

  execute 'edit' fnameescape(l:file)
  call cursor(l:line, l:col)
endfunction

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

if has('macunix')
    set clipboard=unnamed
else
    set clipboard=unnamedplus
endif

set noerrorbells
set visualbell
set t_vb=
set formatoptions-=cro

let g:netrw_bufsettings = 'rnu'

let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_better_performance = 1
packloadall
colorscheme gruvbox-material

highlight! link IncSearch Visual
autocmd ColorScheme * highlight! link IncSearch Visual
highlight! link Search Visual

if has('nvim')
    lua << EOF
    vim.diagnostic.config({
        virtual_text = false,
        signs = false,
        underline = false,
        update_in_insert = false,
        severity_sort = false,
    })
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
    
    local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    end
    
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

	local project_vimrc = vim.fn.getcwd() .. "/.vimrc"
	if vim.fn.filereadable(project_vimrc) == 1 then
	  vim.cmd("source " .. project_vimrc)
end
EOF
endif
