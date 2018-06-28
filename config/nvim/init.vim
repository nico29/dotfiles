call plug#begin('~/.local/share/nvim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'ternjs/tern_for_vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'heavenshell/vim-jsdoc'
Plug 'jparise/vim-graphql'
Plug 'mxw/vim-jsx'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
call plug#end()

" back to normal
imap jj <Esc>

" reload file when change occurs outside of vim
set autoread

" change the working directory
set autochdir

" easy switch between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" moving lines
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
inoremap <S-j> <Esc>:m .+1<CR>==gi
inoremap <S-k> <Esc>:m .-2<CR>==gi

" Font encoding
set encoding=utf8
set guifont=Dank\ Mono\ Nerd\ Font:h11

" Line number
set number
set cursorline
set numberwidth=4

" show invisibles
set list listchars=space:.

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
let g:nord_comment_brightness = 20
let g:nord_uniform_status_lines = 1
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1
colorscheme nord
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

" NerdTree
" reveal w/ ctrl+b
map <C-b> :NERDTreeToggle<CR>
let g:NERDTreeLimitedSyntax = 1

" JS linter specific things
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
let g:ale_sign_error = '✖'
hi ALEErrorSign guifg=#DF8C8C
let g:ale_sign_warning = '⚠'
hi ALEWarningSign guifg=#F2C38F

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
let g:ctrlp_working_path_mode = 'ra'

" Set specific file stype and set specific options
autocmd BufRead *.js set filetype=javascript
autocmd BufRead *.jsx set filetype=javascript
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell
