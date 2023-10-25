" ------ FIXING VIM 'FEATURES' ------ "

" Stop annoying error bells/visuals
set noerrorbells visualbell t_vb=
if has('autocmd')
	  autocmd GUIEnter * set visualbell t_vb=
endif

" Fix colours
if !has('gui_running')
    set t_Co=256                                        " Set number of colours available
endif

" ------ GENERAL SETTINGS ------ "
syntax on                                               " Enable syntax highlighting 
filetype indent on                                      " Indent based on file type
set tabstop=2 shiftwidth=2 softtabstop=2                " Indentation levels
set expandtab smarttab autoindent                       " Tab settings
set nobackup nowritebackup noundofile noswapfile        " Disable backups/swap files. We save often; VCS should be used for accidental edits/removals
set ignorecase smartcase incsearch hlsearch             " Text searching 
set number relativenumber                               " Line Numbering
set wrap linebreak breakindent                          " Line wrapping - purely UI (not saved to file) 
set showbreak=+++\                                      " When text is wrapped, prefix with '+++ ' to signify wrapping 
set wildmode=list:lastused,longest,full                 " Auto-complete list preview sorting
set completeopt=menu,menuone,preview,noselect,noinsert  " Auto-complete menu display settings
set wildignore+=*.docx,*.jpg,*.png,*.gif,*.pdf          " Add to ignore list when searching for files/ content within files
set wildignore+=*.pyc,*.exe,*.flv,*.img,*.xlsx          " Above continued
set encoding=utf-8                                      " Document encoding
set path+=.,,**;                                        " Set path to be current dir, dir of current file and search them recursively 
set laststatus=2                                        " Show status line at all times (regardless of # files open)
set colorcolumn=150                                     " Set Colour Column line
set nospell                                             " Disable spell checking, we enable it ad-hoc when needed
set background=dark                                     " Background colour theming
set mouse=a                                             " Enable mouse support
set cursorline
set showmatch                                           " Show matching pairs of [],() and {}
set scroll=0                                            " Moves by 1/2 # of lines in window when using CTRL+D and CTRL+U 
let g:netrw_banner = 0                                  " Disable banner from netrw
let g:netrw_liststyle = 3                               " Set the (tree) display style of netrw 
let g:netrw_browse_split = 0                            " Open file selected in same window (overtaking netrw)
let g:netrw_alto = 1
let g:netrw_winsize = 25
set statusline=%r%4*\ %y%*%4*\ %F%*%2*%m%*%2*%r%*%1*%=\ Line\ %l\/%L\ [%p%%]\ \|\ %{strftime('%a\ %I:%M%p\ %d/%m/%Y')} " Status line content
highlight SpellBad cterm=bold ctermbg=darkred           " Spelling error highlighting
highlight CursorLine cterm=bold ctermbg=black           " Cursor line settings



set termguicolors                                       " Enable use of all colours
colorscheme desert                                      " Set colour scheme
