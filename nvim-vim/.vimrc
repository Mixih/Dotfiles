"""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SECTION
""""""""""""""""""""""""""""""""""""""""""""""
" install plugins using vim-plug
call plug#begin('~/.vim/plugged')
" git indicators in the gutter
Plug 'airblade/vim-gitgutter'
Plug 'arakashic/chromatica.nvim'
" LSP provider
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh ',
    \ }
" better jinja filetype detection
Plug 'Glench/Vim-Jinja2-Syntax'
" fzf for search, menus and stuff
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" text alignment tools
Plug 'junegunn/vim-easy-align'
" LSP based tags support
Plug 'liuchengxu/vista.vim'
" rapid HTML editing snippets to make it less hellish
Plug 'mattn/emmet-vim'
" neomake linters
Plug 'neomake/neomake'
"
Plug 'octol/vim-cpp-enhanced-highlight'
" rapid vim commenting support
Plug 'preservim/nerdcommenter'
" Tree file explorer
Plug 'preservim/nerdtree'
" Vimspector debugger support
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python'}
" editor theme
Plug 'rakr/vim-one'
" better syntax highlighting for most modern languages
Plug 'sheerun/vim-polyglot'
" deoplete for neovim (autocomplete provider)
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shirk/vim-gas'
Plug 'Shougo/echodoc.vim'
" Very powerful snippets
Plug 'SirVer/ultisnips'
" Sublime-style multiline select
Plug 'terryma/vim-multiple-cursors'
" git integration
Plug 'tpope/vim-fugitive'
" easy way to wrap text with paired chars
Plug 'tpope/vim-surround'
" status bar for vim
Plug 'vim-airline/vim-airline'
" Allows better edit mode exiting
Plug 'zhou13/vim-easyescape'
call plug#end()

" Enable Basic GDB support
"packadd! vimdebug

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
" change the way paths are shown in the tabline
let g:airline#extensions#tabline#formatter = 'unique_tail'
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
" Indentation
" General indent overrides for files that look better with different
" tabstop
augroup cust_indent
    autocmd!
    " html should be indented by two spaces per google and twitter style guides
    autocmd FileType html set tabstop=8 shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType htmldjango set tabstop=8 shiftwidth=2 softtabstop=2 expandtab
    " Special tabbing for Makefiles which need actual tabs
    autocmd FileType make set noexpandtab shiftwidth=8 tabstop=8 softtabstop=0
    " yaml should also be indented by two spaces in most coding standards
    autocmd FileType yaml set tabstop=8 shiftwidth=2 softtabstop=2 expandtab
    " override GNU ASM files to use spaces
    set tabstop=8 shiftwidth=4 softtabstop=4 expandtab
augroup END
" tabbing for everything else
set tabstop=8 shiftwidth=4 softtabstop=4 expandtab

" strip trailing spaces
augroup strip_trailing
    autocmd!
    autocmd FileType asm,c,cpp,gas,java,python,vim
        \ autocmd! BufWritePre <buffer> %s/\s\+$//e
augroup END

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
filetype plugin indent on
" Disable cursor shape switching in insert mode
set guicursor=

" Set spellcheck on certain classes of files
augroup set_spelling
    autocmd!
    autocmd BufRead,BufNewFile *.md,*.tex setlocal spell
    autocmd FileType gitcommit,text setlocal spell
augroup END

" snippet to bind autocomplete to ctrl-space
if has("gui_running")
    " C-Space seems to work under gVim on both Linux and win32
    inoremap <C-Space> <C-n>
else " no gui
    if has("unix")
        inoremap <C-Space> 
    endif
endif
" syntax debug mapping
" GENERAL PLUGIN SECTION
""""""""""""""""""""""""""""""""""""""""""""""
" Nerd commenter settings
" Automatically insert spaces after comment delimiters
let g:NERDSpaceDelims = 1
" Trim trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Vim-Easy-Escape keybinds
" Bind 1 'j' and 1 'k'
let g:easyescape_chars = { 'j': 1, 'k': 1 }
" 100 ms timout
let g:easyescape_timeout = 100
" bind jk and kj
cnoremap jk <ESC>
cnoremap kj <ESC>

" Deoplete autocomplete config
let g:deoplete#enable_at_startup = 1

" echodoc config
let g:echodoc_enable_at_startup = 1
let g:echodoc#type = 'floating'

" LanguageClient config
" Configured LanguageServers
let g:LanguageClient_serverCommands = {
    \ 'c'              : ['clangd', '--background-index', '-cross-file-rename'],
    \ 'cpp'            : ['clangd', '--background-index', '-cross-file-rename'],
    \ 'css'            : ['css-languageserver', '--stdio'],
    \ 'html'           : ['html-languageserver', '--stdio'],
    \ 'javascript'     : ['javascript-typescript-stdio'],
    \ 'javascript.jsx' : ['javascript-typescript-stdio'],
    \ 'json'           : ['vscode-json-languageserver', '--stdio'],
    \ 'less'           : ['css-languageserver', '--stdio'],
    \ 'python'         : ['pyls'],
    \ 'ruby'           : ['~/.rbenv/shims/solargraph', 'stdio'],
    \ 'rust'           : ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'scss'           : ['css-languageserver', '--stdio']
    \ }
" map LanguageClient keymappings only for supported languages
function LC_map_keys()
    if has_key(g:LanguageClient_serverCommands, &filetype)
        " bind F5 to context menu
        nnoremap <F5> :call LanguageClient_contextMenu()<CR>
        nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
        nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
        nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    endif
endfunction
" map keys on supported buffers
autocmd FileType * call LC_map_keys()

" UltiSnips config
let g:UltiSnipsExpandTrigger       = '<tab>'
let g:UltiSnipsJumpForwardTrigger  = '<c-b>'
let g:UltiSnipsJumpBackwardTrigger = '<c-z>'

" Vim-Multiple-Cursors config
" Manually map for comfort
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
" Prevent deoplete from trying to complete a multi-cursors selection with piles
" of gibberish
" Multiple Cursors entry function called before MC mode is entered
function! Multiple_cursors_before()
    if deoplete#is_enabled()
        call deoplete#disable()
        let g:deoplete_is_enable_before_multi_cursors = 1
    else
        let g:deoplete_is_enable_before_multi_cursors = 0
    endif
endfunction
" Multiple cursors exit function called after MC mode is exited
function! Multiple_cursors_after()
    if g:deoplete_is_enable_before_multi_cursors
        call deoplete#enable()
    endif
endfunction

" Vim Easy Align config
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Chromatica Config
" augroup chromatica_load
    " autocmd!
    " autocmd BufReadPre,FileReadPre,BufNewFile *.c,*.cpp,*.h,*.hpp ChromaticaStart
" augroup END
" let g:chromatica#responsive_mode=1

" Enhanced cpp highlight config
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

" NERDTree config
" keymaps
nnoremap <leader>tt :NERDTreeToggle<CR>
nnoremap <leader>tf :NERDTreeFocus<CR>

" VIMSpector Config
function! Vimspector_start()
    nmap <F3>  <Plug>VimspectorStop
    nmap <F4>  <Plug>VimspectorRestart
    nmap <F17> <Plug>VimspectorContinue
    nmap <F10> <Plug>VimspectorStepOver
    nmap <F11> <Plug>VimspectorStepInto
    nmap <F12> <Plug>VimspectorStepOut
    call vimspector#Launch()
endfunction

function! Vimspector_stop()
    nunmap <F3>
    nunmap <F4>
    nunmap <F17>
    nunmap <F10>
    nunmap <F11>
    nunmap <F12>
    exe 'VimspectorReset'
endfunction

nmap <leader><F9> <Plug>VimspectorToggleConditionalBreakpoint
nmap <F9> <Plug>VimspectorToggleBreakpoint
nnoremap <leader>vsl :call Vimspector_start()<CR>
nnoremap <leader>vss :call Vimspector_stop()<CR>
nnoremap <leader>ve :<c-u>call vimspector#Evaluate( expand( '<cexpr>' ) )<CR>


" Vista config
augroup vista_set_exec
    autocmd!
    autocmd FileType c,cpp,css,html let g:vista_default_executive = 'lcn'
augroup END
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1
nnoremap <leader>vst :Vista!!<CR>
