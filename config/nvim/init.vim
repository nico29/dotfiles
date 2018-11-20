call plug#begin('~/.local/share/nvim/plugged')
" colors
Plug 'arcticicestudio/nord-vim'
Plug 'mhartington/oceanic-next'
Plug 'haishanh/night-owl.vim'
Plug 'dikiaap/minimalist'

" visual things
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

" linter
Plug 'w0rp/ale'

" syntaxes
Plug 'othree/yajs.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'jparise/vim-graphql'
Plug 'mxw/vim-jsx'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'sheerun/vim-polyglot'

" completions
" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'wokalski/autocomplete-flow'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }
Plug 'Quramy/tsuquyomi'
" utils
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" Space mappings
nnoremap <SPACE> <Nop>
let mapleader="\<Space>"
let maplocalleader = "\<Space>"

" indent and cursor back in place
nnoremap <leader>i gg=G''
set hidden
set clipboard^=unnamed  " Copy text to system clipboard<Paste>

set autoread " reload file when change occurs outside of vim
set noswapfile " disable swap files
" set autochdir " change the working directory

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
vnoremap J :m '>+1<CR>gv=gv'
vnoremap K :m '<-2<CR>gv=gv'

" Git things
nnoremap <leader>gs :Gstatus<CR>
" Font encoding
set encoding=utf8

" Line number
set number
set rnu
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

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" Color scheme and UI things
syntax enable
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext
" let g:lightline = {
"             \ 'colorscheme': 'oceanicnext',
"             \ 'active': {
"             \   'left': [ [ 'mode', 'paste' ],
"             \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"             \ },
"             \ 'component_function': {
"             \   'gitbranch': 'fugitive#head'
"             \ },
"             \ }
let g:airline_theme='oceanicnext'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" NerdTree
set mouse=a
nnoremap <leader>b :NERDTreeToggle<CR>
" exit if only nerdtree is openned
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeMouseMode=3 " Use NERDTree with a mouse
let g:NERDTreeShowHidden=1 " Show dotfiles by default
let loaded_netrwPlugin=1 " Disable netrw since we're going to hijack it with NERDTree anyway
let NERDTreeRespectWildIgnore=1 " Respect wildignore
let g:NERDTreeHijackNetrw = 1 " Use the split explorer model, hijack netrw
let g:NERDTreeMinimalUI=1 " Hide 'Press ? for help' prompt
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsOS = 'Darwin'
" highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

" JS linter specific things
let g:ale_fixers = {
            \   'javascript': ['eslint'],
            \   'typescript': ['eslint'],
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
let g:neosnippet#enable_completed_snippet = 1
let g:jsdoc_enable_es6=1
let g:jsdoc_param_description_separator = '-'
" let g:LanguageClient_serverCommands = {
"\'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"\'typescript': ['/usr/local/bin/javascript-typescript-stdio'],
            " \ }

" Remove trailling white spaces before saving
autocmd BufWritePre * %s/\s\+$//e

" Fuzzy finder
nnoremap <leader>p :FZF<CR>
" Set specific file stype and set specific options
autocmd BufRead *.js set filetype=javascript
autocmd BufRead *.jsx set filetype=javascript
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell

" Open new splits to the right and the bottom
set splitbelow
set splitright

