call plug#begin('~/.local/share/nvim/plugged')
Plug 'mhartington/oceanic-next'
Plug 'trevordmiller/nova-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ryanoasis/vim-webdevicons'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
call plug#end()

" Line number
set number
set numberwidth=5

" Search highlight
set hlsearch

if (has("termguicolors"))
 set termguicolors
endif

syntax enable
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
" let g:airline_theme='oceanicnext'
let g:airline_powerline_fonts = 1
let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
" colorscheme OceanicNext
colorscheme nova 
"
" JS linter specific things
let b:ale_fixers = ['eslint']
let g:ale_sign_error = '✖'
hi ALEErrorSign guifg=#DF8C8C
let g:ale_sign_warning = '⚠'
hi ALEWarningSign guifg=#F2C38F
