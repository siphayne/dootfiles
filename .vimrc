set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
"Solarized displays icky in terminal
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'
"Generates a file for YCM to use. Use: YcmGenerateConfig
Plugin 'rdnetto/YCM-Generator'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'ntpeters/vim-better-whitespace'

call vundle#end()
filetype plugin indent on

set history=700
set term=xterm-256color
let &t_Co=256
set t_Co=256
set mouse=a
set hidden

"Syntax highlighting and command line tab completion
syntax on
set wildignore=*.o,*~,*.pyc
set wildmode=longest,list,full
set wildmenu
set backspace=2
"set omnifunc=syntaxcomplete#Complete
"set completeopt=longest,menuone
"Colors
"clears the screen so terminal background doesn't affect us
if &term =~ '256color'
	set t_ut=
endif
let g:solarized_termcolors=256
set background=dark "background always dark
colorscheme solarized
colorscheme VIvid
colorscheme mopkai
colorscheme gotham256
colorscheme alduin
colorscheme harlequin
colorscheme Benokai
colorscheme mushroom
colorscheme madeofcode
colorscheme neonwave
colorscheme wellsokai
colorscheme valloric
colorscheme luna-term
colorscheme moonshine
"colorscheme iceberg
"colorscheme zenburn
"colorscheme jellyx

"Navigation
set nu      "number lines
set ruler   "Where am I shown in lower right

"Highlight search features
set ignorecase  "Ignore case when searching
set smartcase   "If capital letter in search then be case sensitive
set hlsearch    "Highlight search matches
set showmatch   "Highlight matching braces

"Good tabstop
"set expandtab       "Insert spaces instead of tab 
set smarttab        "Aligning tabs when not at beginning of line
set shiftwidth=4    "How much to re indent (C compatibility)
set softtabstop=4   "How much to indent soft tabs
set tabstop=4       "How much to indent hard tabs

"auto newline at 80 chars
setl tw=80
set formatoptions+=t

"highlight things that hit the 81st column
highlight ColorColumn ctermbg=0xaf005f guibg=#d33682
call matchadd('ColorColumn', '\%85v', 100)

"smart word wrapping
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0

set ai "auto indent
set si "smart indent
set wrap "set line wrap

if exists('+cursorline')
    set cursorline
endif

"No header on printing because I have to print code all the time 
"(Actually just for CS381)
set printheader=""

"don't: highlight the line, just have the bar. guisp changes color on the gui
hi clear CursorLine
set cursorline
hi cursorline term=underline cterm=underline
hi cursorline ctermfg=NONE ctermbg=NONE
hi clear CursorLine


" don't blink the cursor
set gcr=a:blinkon0
set gcr=a:ver20-Cursor


"ACP := AutoComplPop
" How keyword completion is triggered with ACP.  Usually you want variables before
" the current line.  ... Unless you write a file bottom up, that is.
let g:acp_behaviorKeywordCommand = "\<C-P>"
"prevent keyword completion 
"let g:acp_behaviorKeywordLength = -1

"key mappings. See "help keynoatation if a symbol doesn't make sense
nmap <Up>       gk
nmap <Down>     gj
nmap j          gk
nmap k          gj

inoremap /* /*  */<Left><Left><Left>

:nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
:nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
:nmap \M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
:nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
:nmap \nt :NERDTree<CR>

nnoremap ; :

"so powerline always shows
set laststatus=2

"supertab double <CR> fix
"let g:SuperTabCrMapping = 0

"Syntastical
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_no_include_search = 0
let g:syntastic_javascript_checkers = ["jshint"]
let g:syntastic_html_jshint_conf = "$HOME/.jshintrc"
let g:syntastic_coffeescript_checkers = ["coffeelint"]
let g:syntastic_cpp_compiler = ["g++", "clang"]
let g:syntastic_c_compiler = ["gcc", "clang"]
let g:syntastic_haskell_compiler = "ghci"
let g:syntastic_asm_checkers = ["nasm"]
let g:syntastic_c_compiler_options = "-Wall -g"
"let g:syntastic_c_compiler_options = "-Wall -Wshadow -Wunreachable-code -Wredundant-decls -Wmissing-declarations -Wold-style-definition -Wmissing-prototypes -Wdeclaration-after-statement =std=c99"
let g:syntastic_error_symbol = ">"
let g:syntastic_warning_symbol = "%"

"Airline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
" enable/disable YCM integration >
let g:airline#extensions#ycm#enabled = 1
" set error count prefix >
let g:airline#extensions#ycm#error_symbol = 'E:'
" set warning count prefix >
let g:airline#extensions#ycm#warning_symbol = 'W:'

"Easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere with minimal keystrokes and with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

"YouCompleteMe settings
let g:ycm_global_ycm_extra_conf = '.'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

"hjkl mappings for easymotion
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

" Gif config

" Require tpope/vim-repeat to enable dot repeat support
" Jump to anywhere with only `s{char}{target}`
" `s<CR>` repeat last find motion.
nmap s <Plug>(easymotion-s)
" Bidirectional & within line 't' motion
omap t <Plug>(easymotion-bd-tl)
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
 " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1

"Indent guides for Solarized TODO: Not working
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1

"Parenthesis be purdy
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

" buffergator setups
let g:buffergator_viewport_split_policy = "R"
let g:buffergator_autodismiss_on_select = 0
let g:buffergator_autoupdate = 1
let g:buffergator_split_size = 30
let g:buffergator_sort_regime = "mru"


"pretty font
set guifont=Inconsolata:h10

"Circos syntax highlighting
"augroup filetype
"  au! BufNewFile,BufRead circos*conf,ideogram*conf,ticks*conf
"  set ft=circos ai textwidth=80 formatoptions=tcroqn2 comments=n:>
"augroup END

"Haskell nice maps
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

noremap :Hexmode on<CR> :%!xxd<CR>
noremap :Hexmode off<CR> :%!xxd -r<CR>

"Trying some stuff out
"Ignore arrow keys, use hjkl
"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>
"move on display lines, not real lines
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
"w now moves by WORD and W now moves by word
nnoremap w W
nnoremap W w
