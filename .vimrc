" make vim vim
set nocompatible

"
" Plugs
"
" After adding a new plug, do: `:so %` and `:PlugInstall`
"
" vim-plug setup
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" add a gutter to show git diff summary
Plug 'airblade/vim-gitgutter'

" elixir block text objects
Plug 'andyl/vim-textobj-elixir'
Plug 'kana/vim-textobj-user'

" Full path fuzzy file, buffer, mru, tag, ... finder
Plug 'ctrlpvim/ctrlp.vim'

" ctags management
Plug 'ludovicchabant/vim-gutentags'

" indent level text object
Plug 'michaeljsmith/vim-indent-object'

" Asynchronous lint engine (credo)
Plug 'w0rp/ale'

" understand all the languages
Plug 'sheerun/vim-polyglot'

" moar Elixir integration
Plug 'slashmili/alchemist.vim'

" comment blocks
Plug 'tpope/vim-commentary'

" automatically insert `end` after `do`
Plug 'tpope/vim-endwise'

" surround text objects
Plug 'tpope/vim-surround'

" work with git
Plug 'tpope/vim-fugitive'

" make . repeat stuff from a plugin
Plug 'tpope/vim-repeat'

" enhance fugutive to know about github
Plug 'tpope/vim-rhubarb'

" programming text objects
Plug 'wellle/targets.vim'

call plug#end()

"
" My config
"
"
" spell git commit messages, and wrap at 72 chars
autocmd Filetype gitcommit setlocal spell textwidth=72
" auto save files on the way out
autocmd BufLeave,FocusLost * silent! wall
" strip trailing whitespace from lines
autocmd BufWritePre * %s/\s\+$//e

" Make `:` much easier to get to by using <SPACE>
map <SPACE> :


" terminal has a dark background
set bg=dark
" share the MacOS system clipboard
set clipboard=unnamed
" highlight lines longer than 100 chars
set colorcolumn=+1
" Store swap files in fixed location, not current directory.
set dir=~/.vimswap//,~/tmp//,/tmp//,/var/tmp//,.
" spaces, not tabs
set expandtab
" highlight search results as you type
set hlsearch
" ignore case in search results (modified by smartcase)
set ignorecase
" move the cursor to search matches as you type
set incsearch
" show a status line at the bottom
set laststatus=2
" enable mouse support in all modes
set mouse=a
" hide the mouse cursor when you start to type
set mousehide
" don't wrap long lines
set nowrap
" show line numbers
set number
" nice small font for printing
set printfont=Fira\ Mono:h8
" show row,col in the status line
set ruler
" tabs are two spaces
set shiftwidth=2
" modify ignorecase to only activate when all-lowercase
set smartcase
" tabs are two spaces
set softtabstop=2
" 100 characters per line
set textwidth=100
" put the persistent undo files here
set undodir=~/.vim/undodir
" enable persistent undo
set undofile
" store a lot
set undolevels=100000
" keep undo for files smaller than this on :e!
set undoreload=1000000
" make the vim-gitgutter checks happen faster
set updatetime=250

" enable syntax highlighting
syntax on

" change the mapleader from \ to ,
let mapleader=","

" make 'go to definition' work
let g:alchemist_tag_disable = 1

"
" Configure Ctrlp
"
" show more results from search
let g:ctrlp_match_window = 'min:5,max:20,results:100'
" make new files open in the same buffer, no splits
let g:ctrlp_open_new_file = 'v'
" ignore files listed in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" put ctags here
let g:gutentags_cache_dir = '~/.tags_cache'

" make the default directory browser thing (netrw) better
"
" no banner across the top
let g:netrw_banner = 0
" tree view by default
let g:netrw_liststyle = 3

" make the colorcolumn very dark grey
highlight ColorColumn ctermbg=8
" make the line numbers dark grey
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE

"" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" make Shift-Down and Shift-Up not special
noremap <S-Down> <Down>
noremap <S-Up> <Up>
