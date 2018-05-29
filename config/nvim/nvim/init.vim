call plug#begin('~/.local/share/nvim/plugged')
Plug 'mhartington/oceanic-next'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
call plug#end()

if (has("termguicolors"))
 set termguicolors
endif

syntax enable
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext
