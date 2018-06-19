call plug#begin('~/.local/share/nvim/plugged')
Plug 'trevordmiller/nova-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ryanoasis/vim-webdevicons'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'jiangmiao/auto-pairs'
Plug 'styled-components/vim-styled-components', { 'branch': 'rewrite' }
Plug 'tpope/vim-surround'
call plug#end()

" Line number
set number
set numberwidth=5
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

" JS linter specific things
let b:ale_fixers = ['eslint']
let g:ale_sign_error = '✖'
hi ALEErrorSign guifg=#DF8C8C
let g:ale_sign_warning = '⚠'
hi ALEWarningSign guifg=#F2C38F

" Completion
let g:deoplete#enable_at_startup = 1

" Remove trailling white spaces before saving
autocmd BufWritePre * %s/\s\+$//e

" Set specific file stype and set specific options
autocmd BufRead *.js set filetype=javascript
autocmd BufRead *.jsx set filetype=javascript
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell
