" ------ PLUGINS ------ "
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " Fuzzy Finder Plugin for fast seaching - fzf#install() downloads latest binary (needed)
Plug 'tpope/vim-fugitive'                               " Best git plugin for Vim 
"Plug 'junegunn/gv.vim'                                  " Git commit browser for Vim (dependancy: vim-fugitive)
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }   " Best Vim file explorer
Plug 'junegunn/vim-easy-align'                          " Easy aligning by delimiter 
Plug 'junegunn/rainbow_parentheses.vim'                 " Rainbow parenthesis
Plug 'vim-airline/vim-airline'                          " Nice status line
Plug 'mhinz/vim-signify'                                " Show changed lines in a file managed by a VCS
Plug 'dense-analysis/ale'                               " Language server, linting (async lint engine)
Plug 'ryanoasis/vim-devicons'                           " Pretty icons in Vim
Plug 'lambdalisue/battery.vim/'                         " Show battery percentage in status bar
call plug#end()
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
"set laststatus=2                                        " Show status line at all times (regardless of # files open)
set colorcolumn=150                                     " Set Colour Column line
set nospell                                             " Disable spell checking, we enable it ad-hoc when needed
set background=dark                                     " Background colour theming
set mouse=a                                             " Enable mouse support
set cursorline
set matchpairs+=<:>                                     " Enable matching for tags 
"set showmatch                                           " Show matching pairs of [],() and {} (and <> from above line)
set scroll=0                                            " Moves by 1/2 # of lines in window when using CTRL+D and CTRL+U 
set ttyfast                                             " Enable fast scrolling
set viminfo='100,<9999,s100                             " Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
let g:airline_left_sep='>'
let g:airline_right_sep='<'
"let g:airline_symbols_ascii = 1
"let g:airline_skip_empty_sections = 1
"let g:airline_highlighting_cache = 1
"let g:airline_powerline_fonts = 1
"let g:airline_experimental = 1                          " Disable default use of experimental airline plugin. This uses VimScript9 but idk if it fully working
"set statusline=%r%4*\ %y%*%4*\ %F%*%2*%m%*%2*%r%*%1*%=\ Line\ %l\/%L\ [%p%%]\ \|\ %{strftime('%a\ %I:%M%p\ %d/%m/%Y')} " Status line content

function! s:update_highlights()
  highlight SpellBad cterm=bold ctermbg=darkred           " Spelling error highlighting
  highlight CursorLine cterm=bold ctermbg=black           " Cursor line settings
endfunction
autocmd User AirlineAfterTheme call s:update_highlights()



set termguicolors                                       " Enable use of all colours
colorscheme desert                                      " Set colour scheme



" ----- Mappings ----- "

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
