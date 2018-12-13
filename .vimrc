"   ___           __              ___       _
"  / _ | ___  ___/ /______ ___   / _ | ____(_)__ ____
" / __ |/ _ \/ _  / __/ -_|_-<  / __ |/ __/ / _ `(_-<
"/_/ |_/_//_/\_,_/_/  \__/___/ /_/ |_/_/ /_/\_,_/___/
"
" MY PERSONAL VIMRC FILE.
" ================================================
" LICENSE: USE THIS IF YOU LIKE, YOU CAN CHANGE
" WHATEVER YOU WANT, I DON'T CARE.
" ================================================
"
" I keep this file as documented as possible, so I 
" don't forget what I need, also, if someone else
" finds this useful, so they know what they're getting.
"
" REMEMBER TO INSTALL VUNDLE!

set nocompatible " This is VIm, be iMproved.
filetype off " Vundle requires this, don't ask me why.
" Disables the arrow keys, forces you to properly
" move around Vim
set incsearch " Incremental search, for /
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

" ==== Leader key custom shortcuts ====
" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
" Adds a semicolon to the end of the line.
nnoremap <Leader>; A;<Esc>
" Yanks to the system clipboard.
nnoremap <Leader>c "+y

" ==== UI OPTIONS ====
set nowrap " First annoyance: line wrapping, instantly disabled.
set number " Show line number
set relativenumber " Set relative number by default.  Easier for counting lines.
set ruler " Shows the informative ruler at the lower part of the screen.
set showcmd " Shows commands on the lower bar.
set cursorline " Higlights the line where the cursor is currently at.
filetype indent on " Loads indentation options based on file extension.
set showmatch " Highlights parenthesis pairs.
set confirm " Asks if you want to save when you exit Vim.
" Highlights the text when it goes past the 80-line limit:
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" ==== TABS AND SPACES ====
set tabstop=4 " Inputs 4 spaces on TAB in Normal Mode.
set softtabstop=4 " Inputs 4 spaces on TAB in Insert Mode.
set expandtab " Tabs are spaces, fuck the Silicon Valley's scene on this.
set autoindent " Automatically indents.
set cindent " Proper C-like indent.
set shiftwidth=4 " Avoid double indent.

" ==== PLUGINS ====
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " Yo dawd, let Vundle manage Vundle 
Plugin 'octol/vim-cpp-enhanced-highlight' " Better C++ syntax highlighting.
Plugin 'chriskempson/base16-vim' " Base15 color schemes.
Plugin 'vim-python/python-syntax' " Better Python syntax highlighting.
Plugin 'vim-airline/vim-airline' " The fresh little bar we all know and love.
Plugin 'vim-airline/vim-airline-themes' " Themes for the airline.
Plugin 'Townk/vim-autoclose' " Shameful I know, autocloses bracks and all that stuff.
Plugin 'vim-syntastic/syntastic' " Linter, I need this for checking syntax now and then.
Plugin 'SirVer/ultisnips' " Snippet engine.
Plugin 'honza/vim-snippets' " Snippet collection.
Plugin 'tpope/vim-obsession' " Stores sessions between restarts.
Plugin 'junegunn/goyo.vim' " Distraction-free writing.
Plugin 'lervag/vimtex' " LaTeX utilities.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ==== LOOK AND FEEL ====
syntax on
let base16colorspace=256
colorscheme base16-default-dark
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16' " The theme I like.
let g:python_highlight_all = 1 " Enables full Python syntax highlighting.

" ==== TAG JUMPING AND AUTOCOMPLETE ====
" Reads a tags file and uses that for autocompletion and file jumping tasks:
command! MakeTags !ctags -R . 

" ==== SNIPPETS ===
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ==== DOCUMENT AUTHORING ====
" I'm a huge LaTeX and Markdown nerd, so of course my vim setup will have some
" LaTeX and Markdown utilities that I use to make my document authoring easier.
autocmd BufRead,BufNewFile *.md setlocal spell " Auto spell check on MD files.
autocmd BufRead,BufNewFile *.md setlocal spelllang=en,es " Use both english and spanish.
autocmd BufRead,BufNewFile *.tex setlocal spell " Auto spell check on MD and TeX files.
autocmd BufRead,BufNewFile *.tex setlocal spelllang=en,es " Use both english and spanish.
autocmd FileType gitcommit setlocal spell " Auto spell check for git commit messages.
autocmd FileType gitcommit setlocal spelllang=en,es " Use both english and spanish.
let g:tex_flavor='latex' " Use LaTeX instead of ol' TeX.
set grepprg=grep\ -nH\ $*
let g:Tex_Folding=0 "I don't like folding.
set iskeyword+=:
" Changes the spell mistake highltight to a simple underline 
hi clear SpellBad
hi SpellBad cterm=underline
