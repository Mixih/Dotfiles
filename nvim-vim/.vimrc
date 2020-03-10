""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SECTION
""""""""""""""""""""""""""""""""""""""""""""""
" install plugins using vim-plug
call plug#begin('~/.vim/plugged')
" editor theme
Plug 'rakr/vim-one'
" better syntax highlighting for most modern languages
Plug 'sheerun/vim-polyglot'
" better jinja filetype detection
Plug 'Glench/Vim-Jinja2-Syntax'
" status bar for vim
Plug 'vim-airline/vim-airline'
" git integration
Plug 'tpope/vim-fugitive'
" rapid HTML editing snippets to make it less hellish
Plug 'mattn/emmet-vim'
" rapid vim commenting support
Plug 'scrooloose/nerdcommenter'
" Allows better edit mode exiting
Plug 'zhou13/vim-easyescape'
" neomake linters
Plug 'neomake/neomake'
" supertab for autocompletions
Plug 'ervandew/supertab'
call plug#end()


" THEMING SECTION
""""""""""""""""""""""""""""""""""""""""""""""
" Force truecolor support for the sake of tmux
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
" enable syntax highlighting
syntax enable
" set the color scheme
set background=dark
let g:one_allow_italics = 1
" enable onedark theme
colorscheme one
" Airline config
" set airline theme
let g:airline_theme = 'one'
" enable nicer airline fonts
let g:airline_powerline_fonts = 1
" Use airline to theme the tab bar too
let g:airline#extensions#tabline#enabled = 1
" make tab separators vertical instead of angled
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
" make tab number make more sense
let g:airline#extensions#tabline#tab_nr_type = 1
" no buffers?
let g:airline#extensions#tabline#show_buffers = 0
" make linenumber indicator unbold so it doesn't get cut off
" wormaeound for a rather annoying issue that seems to be fixed
" call airline#parts#define('linenr', {
"    \ 'raw': '%{g:airline_symbols.linenr}%4l',
"    \ 'accent': 'none'})
" call airline#parts#define('maxlinenr', {
"    \ 'raw': '/%L%{g:airline_symbols.maxlinenr}',
"    \ 'accent': 'none'})
" make insert exit react faster
set ttimeoutlen=10


" EDITOR SECTION
""""""""""""""""""""""""""""""""""""""""""""""
" Tabbing
" --- Setting overrides for special files ---
" Special tabbing for Makefiles which need actual tabs
if !exists('ao_make_tab')
    let ao_make_tab = 1
    autocmd FileType make set noexpandtab shiftwidth=8 tabstop=8 softtabstop=0
endif
" General indent overrides for files that look better with different
" tabstops
if !exists('ao_indent')
    let ao_indent = 1
    " html should be indented by two spaces per google and twitter style guides
    autocmd FileType html set tabstop=8 shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType htmldjango set tabstop=8 shiftwidth=2 softtabstop=2 expandtab
    " yaml should also be indented by two spaces in most coding standards
    autocmd FileType yaml set tabstop=8 shiftwidth=2 softtabstop=2 expandtab
endif
" strip trailing spaces
if !exists('ao_trailing')
    autocmd FileType c,cpp,java,python  
        \ autocmd BufWritePre <buffer> %s/\s\+$//e
endif
" Set spellcheck on certain classes of files
if !exists('ao_spellcheck')
    autocmd BufRead,BufNewFile *.md setlocal spell
    autocmd FileType gitcommit setlocal spell
endif 
" tabbing for everything else
set tabstop=8 shiftwidth=4 softtabstop=4 expandtab
" convenient quality of life stuff
" highlight the line the cursor is on
set cursorline
" display line numbers on the side
set number
" enforce textwrap at 80 chars
set textwidth=80

" GENERAL SETTINGS SECTION
""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
" Disable cursor shape switching in insert mode
set guicursor=

" GENERAL PLUGIN SECTION
""""""""""""""""""""""""""""""""""""""""""""""
" Nerd commenter settings
" Automatically insert spaces after comment delimiters
let g:NERDSpaceDelims = 1
" Trim trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" easy escape keybinds
" Bind 1 'j' and 1 'k'
let g:easyescape_chars = { "j": 1, "k": 1 }
" 100 ms timout
let g:easyescape_timeout = 100
" bind jk and kj
cnoremap jk <ESC>
cnoremap kj <ESC>
