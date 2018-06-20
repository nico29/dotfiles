call plug#begin('~/.local/share/nvim/plugged')
Plug 'trevordmiller/nova-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'jiangmiao/auto-pairs'
Plug 'styled-components/vim-styled-components', { 'branch': 'rewrite' }
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" easy switch between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Font encoding
set encoding=utf8
set guifont=Dank\ Mono\ Nerd\ Font:h11

" Line number
set number
set numberwidth=5

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
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let g:airline_powerline_fonts = 1
let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
colorscheme nova

" NerdTree
" auto start
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" reveal w/ cmd+b
map <C-b> :NERDTreeToggle<CR>

" JS linter specific things
let b:ale_fixers = ['eslint']
let g:ale_sign_error = '✖'
hi ALEErrorSign guifg=#DF8C8C
let g:ale_sign_warning = '⚠'
hi ALEWarningSign guifg=#F2C38F
" display lint errors in airline
let g:airline#extensions#ale#enabled = 1

" Completion
let g:deoplete#enable_at_startup = 1

" Remove trailling white spaces before saving
autocmd BufWritePre * %s/\s\+$//e

" Set specific file stype and set specific options
autocmd BufRead *.js set filetype=javascript
autocmd BufRead *.jsx set filetype=javascript
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell
