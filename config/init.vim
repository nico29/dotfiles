
call plug#begin('~/.local/share/nvim/plugged')
Plug 'mhartington/oceanic-next'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mxw/vim-jsx'
Plug 'jparise/vim-graphql'
Plug 'hail2u/vim-css3-syntax'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
call plug#end()

" GLOBAL VIM SETTINGS {{{
nnoremap <SPACE> <Nop>
let mapleader="\<Space>"
let maplocalleader = "\<Space>"
set number
set rnu
set nocompatible
set encoding=utf-8
set noswapfile
set nobackup
set autoread
set hidden
set cursorline
set mouse=a
set clipboard^=unnamed " Copy text to system clipboard<Paste>
set hlsearch
set splitbelow
set splitright
set numberwidth=4
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
" }}}

" UI {{{
set termguicolors
syntax enable
colorscheme OceanicNext
let g:airline_theme='oceanicnext'
" }}}

" NERDTree {{{
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nnoremap <leader>b :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
" " exit if only nerdtree is openned
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeMouseMode=3 " Use NERDTree with a mouse
let g:NERDTreeShowHidden=1 " Show dotfiles by default
" }}}

" Airline {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_c = '%f%m'
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%l:%c'
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'c'  : 'C',
      \ 'i'  : 'I',
      \ 'n'  : 'N',
      \ 'R'  : 'R',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ 't'  : 'T',
      \ 'v'  : 'V',
      \ 'V'  : 'V'
      \ }
" }}}
" ALE {{{
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'typescript': ['eslint', 'tslint', 'tsserver', 'typecheck'],
\}
let g:ale_fixers = {
\  'javascript': ['prettier', 'eslint'],
\  'typescript': ['prettier', 'eslint'],
\  'json': ['prettier'],
\  'markdown': ['prettier'],
\  'yaml': ['prettier'],
\  'css': ['prettier'],
\}
" }}}


" COC {{{
let g:coc_global_extensions=['coc-tsserver', 'coc-json', 'coc-css', 'coc-html', 'coc-yaml'] 
" }}}
nnoremap <leader>p :FZF<CR>

autocmd BufRead *.js set filetype=javascript
autocmd BufRead *.jsx set filetype=javascript
autocmd BufRead *.tsx set filetype=typescript
autocmd BufRead,BufNewFile *.md set filetype=markdown
