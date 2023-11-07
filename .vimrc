" ------ PLUGINS ------ "
call plug#begin()
Plug 'vim-scripts/LargeFile'                        " Disables some background things Vim does when opening large files
Plug 'tpope/vim-repeat'                             " Repeat actions made by plugins with `.`
Plug 'tpope/vim-surround'                           " Replace surround paren/quote/etc.
Plug 'tpope/vim-sensible'                           " Sensible vim mappings
Plug 'tpope/vim-jdaddy'                             " JSON pretty print and object manipulation (gqaj/gqij)
Plug 'tpope/vim-fugitive'                           " Best git plugin for Vim
Plug 'tpope/vim-commentary'                         " Commenting shortcuts
Plug 'preservim/nerdtree'                           " Best Vim file explorer
Plug 'mhinz/vim-startify'                           " Vim Start Screen
Plug 'mhinz/vim-signify'                            " Show changed lines in a file managed by a VCS (git)
Plug 'mg979/vim-visual-multi'                       " Multi line editing shortcuts
Plug 'luochen1990/rainbow'                          " Rainbow parenthesis
Plug 'lambdalisue/battery.vim/'                     " Show battery percentage in status bar
Plug 'junegunn/vim-easy-align'                      " Easy aligning by delimiter
Plug 'junegunn/gv.vim'                              " Git commit browser for Vim (dependancy: vim-fugitive)
Plug 'itchyny/lightline.vim'                        " Vim Status Line
Plug 'dense-analysis/ale'                           " Language server, linting (async lint engine)
Plug 'Xuyuanp/nerdtree-git-plugin'                  " Git plugin for NERDTree
Plug 'MattesGroeger/vim-bookmarks'                  " Vim bookmarking
Plug 'ervandew/supertab'                            " Insert mode tab completion
Plug 'vim-scripts/ReplaceWithRegister'              " Replace in place with gr<MOTION>
Plug 'vim-scripts/Auto-Pairs'                       " Auto closing paren, quotes etc.
Plug 'vim-scripts/Align'                            " Dependency of SQLUtilities"
Plug 'vim-scripts/SQLUtilities'                     " SQL Formatting (does other stuff, but not useful to us )
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
set complete-=i                                        " Stop Vim looking through header files for c lookups
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
let g:LargeFile=100                                    " Activate when file is > 100mb


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

" ------ Supertab ------ "
" Insert a literal tab when following any of the below chars
" ^ Start line
let g:SuperTabNoCompleteAfter = ['^', ',', '\s', '"', '''', ';', '|', '\d']

" ------ Bujo ------ "
if !isdirectory('$HOME/vimfiles/bujo')
    call mkdir('$HOME/vimfiles/bujo', "p")
endif

" ------ Indentation Guide ------ "
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" ------ SQLUtilities ------ " 
let g:sqlutil_align_comma = 1               " Display columns in select list how SSMS does
let g:sqlutil_align_keyword_right = 0       " Align keywords on start of word not end of word (see help for more info)
let g:sqlutil_keyword_case = '\U'           " Auto capitalise keywords 

" ------ Mappings ------ "
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Remap CTRL + '/' to comment line/selection
vmap <C-/> gc
nmap <C-/> gcc

" Format SQL
vmap <silent> gqas    :SQLUFormatter<CR>
nmap <silent> gqas    vip gqas

" ------ Useful Shortcuts ------ "
" Pretty Print Shortcut: `gqa`
" Format JSON: gqaj (j for json)
" Format SQL : gqas (s for SQL)



