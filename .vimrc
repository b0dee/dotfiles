" ------ PLUGINS ------ "
call plug#begin()
Plug 'tpope/vim-fugitive'                           " Best git plugin for Vim
Plug 'junegunn/gv.vim'                              " Git commit browser for Vim (dependancy: vim-fugitive)
Plug 'preservim/nerdtree'                           " Best Vim file explorer
Plug 'Xuyuanp/nerdtree-git-plugin'                  " Git plugin for NERDTree
Plug 'itchyny/lightline.vim'                        " Vim Status Line
Plug 'junegunn/vim-easy-align'                      " Easy aligning by delimiter
Plug 'luochen1990/rainbow'                          " Rainbow parenthesis
Plug 'mhinz/vim-signify'                            " Show changed lines in a file managed by a VCS
Plug 'dense-analysis/ale'                           " Language server, linting (async lint engine)
Plug 'lambdalisue/battery.vim/'                     " Show battery percentage in status bar
Plug 'mhinz/vim-startify'                           " Vim Start Screen
Plug 'MattesGroeger/vim-bookmarks'                  " Vim bookmarking
call plug#end()

" ------ Auto Updating Plugins Weekly ------ "
function! OnVimEnter() abort
  " Run PlugUpdate every week automatically when entering Vim.
  if exists('g:plug_home')
    let l:filename = printf('%s/.vim_plug_update', g:plug_home)
    if !filereadable(l:filename)
      call writefile([], l:filename)
    endif
    let l:this_week = strftime('%Y_%V')
    let l:contents = readfile(l:filename)
    if index(l:contents, l:this_week) < 0
      call execute('PlugUpdate')
      call writefile([l:this_week], l:filename, 'a')
    endif
  endif
endfunction

autocmd VimEnter * call OnVimEnter()

" ------ FIXING VIM 'FEATURES' ------ "

" Stop annoying error bells/visuals
autocmd GUIEnter * set vb t_vb= " Disable error bells and visual flash for GUI
autocmd VimEnter * set vb t_vb= " Same as above but terminal
                                " Fix colours
if !has('gui_running')
    set t_Co=256                " Set number of colours available
endif

                                                       " ------ GENERAL SETTINGS ------ "
syntax on                                              " Enable syntax highlighting
filetype indent on                                     " Indent based on file type
set tabstop=2 shiftwidth=2 softtabstop=2               " Indentation levels
set expandtab smarttab autoindent                      " Tab settings
set nobackup nowritebackup noundofile noswapfile       " Disable backups/swap files. We save often; VCS should be used for accidental edits/removals
set ignorecase smartcase incsearch hlsearch            " Text searching
set number relativenumber                              " Line Numbering
set wrap linebreak breakindent                         " Line wrapping - purely UI (not saved to file)
set showbreak=+++\                                     " When text is wrapped, prefix with '+++ ' to eignify wrapping
set wildmode=list:lastused,longest,full                " Auto-complete list preview sorting
set completeopt=menu,menuone,preview,noselect,noinsert " Auto-complete menu display settings
set wildignore+=*.docx,*.jpg,*.png,*.gif,*.pdf         " Add to ignore list when searching for files/ content within files
set wildignore+=*.pyc,*.exe,*.flv,*.img,*.xlsx         " Above continued
set encoding=utf-8                                     " Document encoding
set path+=.,,**;                                       " Set path to be current dir, dir of current file and search them recursively
set laststatus=2                                       " Show status line at all times (regardless of # files open)
set colorcolumn=                                       " Set Colour Column line
set nospell                                            " Disable spell checking, we enable it ad-hoc when needed
set background=dark                                    " Background colour theming
set mouse=a                                            " Enable mouse support
set matchpairs+=<:>                                    " Enable matching for tags
set showmatch                                          " Show matching pairs of [],() and {} (and <> from above line)
set scroll=0                                           " Moves by 1/2 # of lines in window when using CTRL+D and CTRL+U
set ttyfast                                            " Enable fast scrolling
set viminfo='100,<9999,s100                            " Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set noshowmode                                         " No need to notify mode changes, we have them visible perma
set termguicolors                                      " Enable use of all colours
set textwidth=0
set guicursor=n-v-c:block-nCursor
colorscheme desert                                     " Set colour scheme
highlight SpellBad cterm=bold ctermbg=darkred          " Spelling error highlighting
let &t_SI = "\e[5 q"                                   " Blinking line in insert



" ------ Plugin Customisations ------ "

" ------ Bookmarks ------ "
let g:bookmark_sign = '♥'

" ------ Rainbow ------ "
let g:rainbow_active = 1
let g:rainbow_conf = {
\ 	'operators': '_,_',
\ 	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\ 	'separately': {
\ 		'*': {},
\ 		'markdown': {
\ 			'parentheses_options': 'containedin=markdownCode contained', 
\ 		},
\ 		'lisp': {
\ 			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], 
\ 		},
\ 		'haskell': {
\ 			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'], 
\ 		},
\ 		'vim': {
\ 			'parentheses_options': 'containedin=vimFuncBody', 
\ 		}, 
\ 		'perl': {
\ 			'syn_name_prefix': 'perlBlockFoldRainbow', 
\ 		},
\ 		'stylus': {
\ 			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'], 
\ 		},
\ 		'css': 0, 
\ 		'nerdtree': 0, 
\ 	},
\}

" ------ Status Line ------ "
let g:battery_watch_on_startup = 1
let g:battery#update_statusline = 1
let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
let g:battery#component_format = '%v%% %g'
let g:lightline = {
                \   'active': {
                \     'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ],
                \     'right': [ ['battery' ], [ 'lineinfo' ], [ 'percent' ], [ 'filetype', 'fileencoding', 'fileformat', 'lineinfo', ] ], 
                \   },
                \   'component_function': {
                \     'gitbranch':'FugitiveHead',
                \     'battery': 'battery#component',
                \   },
                \   'component': {
                \     'lineinfo': '%3l:%-2v%<',
                \   }
                \ }

" ------ Nerd Tree ------ "
" Map shortcut
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1 
let NERDTreeQuitOnOpen=1

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
let g:NERDTreeGitStatusIndicatorMapCustom = {
\  'Modified'  :'M',
\  'Staged'    :'S',
\  'Untracked' :'U',
\  'Renamed'   :'R',
\  'Unmerged'  :'U',
\  'Deleted'   :'X',
\  'Dirty'     :'D',
\  'Ignored'   :'I',
\  'Clean'     :'C',
\  'Unknown'   :'?',
\ }


" ------ Startify ------ "
let g:startify_session_dir = '$HOME/vimfiles/session'
let g:startify_files_number = 10


" ------ Bujo ------ "
if !isdirectory('$HOME/vimfiles/bujo')
    call mkdir('$HOME/vimfiles/bujo', "p")
endif

" ------ Indentation Guide ------ "
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" ------ Mappings ------ "
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)





