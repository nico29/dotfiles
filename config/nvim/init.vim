call plug#begin('~/.local/share/nvim/plugged')
" Global {{{
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
" }}}

" UI {{{
Plug 'mhartington/oceanic-next'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
" }}}

" Synxtax {{{
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'
Plug 'jparise/vim-graphql'
Plug 'hail2u/vim-css3-syntax'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" }}}

" Completion {{{
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'Quramy/tsuquyomi'
Plug 'w0rp/ale'
" }}}

" Files {{{
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
" }}}

call plug#end()

" GLOBAL VIM SETTINGS {{{
nnoremap <SPACE> <Nop>
let mapleader="\<Space>"
let maplocalleader = "\<Space>"

set nocompatible
set encoding=utf-8
set noswapfile
set nobackup
set autoread
set hidden
set cursorline
set mouse=a
set spell
set spelllang=en
set clipboard^=unnamed " Copy text to system clipboard<Paste>
set hlsearch
set splitbelow
set splitright
" }}}

" NUMBER & INDENTATION {{{
filetype plugin indent on
set number
set rnu
set numberwidth=4
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
" }}}

" COLORS {{{
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
syntax enable
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_uniform_status_lines = 1
let g:nord_comment_brightness = 20
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1
colorscheme nord
" }}}

" Airline {{{
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline_symbols.branch = ''
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='nord'
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_spelllang=0
let g:airline_detect_spell=0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_c = '%f%m'
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%l:%c'
let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0

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

" NerdTree {{{
nnoremap <leader>b :NERDTreeToggle<CR>
" " exit if only nerdtree is openned
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeMouseMode=3 " Use NERDTree with a mouse
let g:NERDTreeShowHidden=1 " Show dotfiles by default
let loaded_netrwPlugin=1 " Disable netrw since we're going to hijack it with NERDTree anyway
let NERDTreeRespectWildIgnore=1 " Respect wildignore
let g:NERDTreeHijackNetrw = 1 " Use the split explorer model, hijack netrw
let g:NERDTreeMinimalUI=1 " Hide 'Press ? for help' prompt
" }}}

" Ale {{{
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
" }}}

" trim whitespaces on save
autocmd BufWritePre * %s/\s\+$//e


" Completions {{{
" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" }}}

" MAPPINGS {{{
nnoremap <leader>p :FZF<CR>
nmap <leader>l :set list!<CR>
set listchars=space:·,eol:¬,trail:-
" indent and cursor back in place
nnoremap <leader>ii gg=G''
" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" tab navigation
nnoremap <leader><left> :tabprevious<CR>
nnoremap <leader><right> :tabnext<CR>
" buffer navigation
nmap <leader>, :bnext<CR>
nmap <leader>; :bprevious<CR>
" }}}

autocmd BufRead *.js set filetype=javascript
autocmd BufRead *.jsx set filetype=javascript
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell
