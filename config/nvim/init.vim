call plug#begin('~/.local/share/nvim/plugged')
Plug 'mhartington/oceanic-next'
Plug 'itchyny/lightline.vim'
Plug 'ternjs/tern_for_vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'othree/es.next.syntax.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'sheerun/vim-polyglot'
Plug 'jparise/vim-graphql'
Plug 'mxw/vim-jsx'
Plug 'ap/vim-css-color'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" Space mappings
nnoremap <SPACE> <Nop>
let mapleader="\<Space>"
let maplocalleader = "\<Space>"

set hidden
set clipboard^=unnamed  " Copy text to system clipboard<Paste>
set lazyredraw " delay redraw a bit

" back to normal
imap jj <Esc>

set autoread " reload file when change occurs outside of vim
set noswapfile " disable swap files
set autochdir " change the working directory

" easy switch between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" moving lines
nnoremap <leader>jj :m .+1<CR>==
nnoremap <leader>kk :m .-2<CR>==
inoremap <leader>jj <Esc>:m .+1<CR>==gi
inoremap <leader>kk <Esc>:m .-2<CR>==gi

" Git things
nnoremap <leader>gs :Gstatus<CR>
" Font encoding
set encoding=utf8
set guifont=Dank\ Mono\ Nerd\ Font:h14

" Line number
set number
set cursorline
set numberwidth=4

" show invisibles
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
set listchars=space:.

" indentation
filetype plugin indent on
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set tabstop=4 " One tab = 4 spaces

" Search highlight
set hlsearch

if (has("termguicolors"))
 set termguicolors
endif

" Color scheme and UI things
syntax enable
colorscheme OceanicNext
let g:lightline = {
\ 'colorscheme': 'oceanicnext'
\}

" NerdTree
" reveal w/ ctrl+b
:set mouse=a
map <C-b> :NERDTreeToggle<CR>
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeMouseMode=3 " Use NERDTree with a mouse
let g:NERDTreeGitStatusNodeColorization=1 " Enable git status colorisation a la Atom
let g:NERDTreeShowHidden=1 " Show dotfiles by default
let loaded_netrwPlugin=1 " Disable netrw since we're going to hijack it with NERDTree anyway
let NERDTreeRespectWildIgnore=1 " Respect wildignore
let g:NERDTreeHijackNetrw = 1 " Use the split explorer model, hijack netrw
let g:NERDTreeMinimalUI=1 " Hide 'Press ? for help' prompt

" JS linter specific things
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
let g:ale_sign_error = '>>'
hi ALEErrorSign guifg=#DF8C8C
let g:ale_sign_warning = '--'
hi ALEWarningSign guifg=#F2C38F
let g:ale_fix_on_save = 1
let g:ale_pattern_options = {
\ '\.json$': {'ale_linters': [], 'ale_fixers': []},
\}
nnoremap <leader>ff :ALEFix<CR>

" javascript things
let g:javascript_plugin_jsdoc = 1

" Completion
let g:deoplete#enable_at_startup = 1
let g:jsdoc_enable_es6=1
let g:jsdoc_param_description_separator = '-'
" Use tern_for_vim.
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" Remove trailling white spaces before saving
autocmd BufWritePre * %s/\s\+$//e

" Fuzzy finder
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Set specific file stype and set specific options
autocmd BufRead *.js set filetype=javascript
autocmd BufRead *.json set filetype=javascript
autocmd BufRead *.jsx set filetype=javascript
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell

" Open new splits to the right and the bottom
set splitbelow
set splitright

