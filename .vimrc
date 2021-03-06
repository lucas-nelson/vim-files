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

" keep vim's current working directory at the project level
Plug 'airblade/vim-rooter'

" elixir block text objects
Plug 'andyl/vim-textobj-elixir'
Plug 'kana/vim-textobj-user'

" Tab auto completion
Plug 'ervandew/supertab'

" Fuzzy file finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" ctags management
Plug 'ludovicchabant/vim-gutentags'

" indent level text object
Plug 'michaeljsmith/vim-indent-object'

" adds :Ack command for searching
Plug 'mileszs/ack.vim'

" Better whitespace highlighting for Vim
Plug 'ntpeters/vim-better-whitespace'

" understand all the languages
Plug 'sheerun/vim-polyglot'

" moar Elixir integration
Plug 'slashmili/alchemist.vim'

" comment blocks
Plug 'tpope/vim-commentary'

" automatically insert `end` after `do`
Plug 'tpope/vim-endwise'

" add some basic file system commands, like :Mkdir
Plug 'tpope/vim-eunuch'

" work with git
Plug 'tpope/vim-fugitive'

" Navigate around, eg. alternate files
Plug 'tpope/vim-projectionist'

" make . repeat stuff from a plugin
Plug 'tpope/vim-repeat'

" enhance fugutive to know about github
Plug 'tpope/vim-rhubarb'

" surround text objects
Plug 'tpope/vim-surround'

" combine with netrw to create a delicious salad dressing
Plug 'tpope/vim-vinegar'

" Asynchronous lint engine (credo)
Plug 'w0rp/ale'

" programming text objects
Plug 'wellle/targets.vim'

" ansi escape sequence processing
Plug 'vim-scripts/AnsiEsc.vim'

call plug#end()

"
" My config
"
"
" spell git commit messages, and wrap at 72 chars
autocmd Filetype gitcommit setlocal spell textwidth=72
" auto save files on the way out
autocmd BufLeave,FocusLost * silent! wall
"" strip trailing whitespace from lines
"autocmd BufWritePre !*.diff %s/\s\+$//e

" Make `:` much easier to get to by using <SPACE>
map <SPACE> :

colorscheme delek

" automatically reload changed files
set autoread
" terminal has a light background
set bg=light
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
" open new vertical splits on the right-hand side
set splitright
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

" don't let ale run dialyxir, way too expensive
let g:ale_linters = { 'elixir': ['credo'] }

" turn on the better whitespace goodness
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitelines_at_eof=1

" make git gutters diff against HEAD, not the index
let g:gitgutter_diff_base = 'HEAD'

" put ctags here
let g:gutentags_cache_dir = '~/.tags_cache'

" make the default directory browser thing (netrw) better
"
" no banner across the top
let g:netrw_banner = 0
" keep netrw's browsing directory and vim's current directory the same
let g:netrw_keepdir = 0
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

  " Use ag over ack
  let g:ackprg = 'ag --vimgrep'
endif

" make Shift-Down and Shift-Up not special
noremap <S-Down> <Down>
noremap <S-Up> <Up>

" fzf key bindings
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

" projectionist config and key bindings
let g:projectionist_heuristics = {
\  "web/router.ex": {
\    "web/controllers/*_controller.ex": {
\      "type": "controller",
\      "alternate": "test/controllers/{}_controller_test.exs",
\    },
\    "web/models/*.ex": {
\      "type": "model",
\      "alternate": "test/models/{}_test.exs",
\    },
\    "web/views/*_view.ex": {
\      "type": "view",
\      "alternate": "test/views/{}_view_test.exs",
\    },
\    "web/templates/*.html.eex": {
\      "type": "template",
\      "alternate": "web/views/{dirname|basename}_view.ex"
\    },
\    "test/*_test.exs": {
\      "type": "test",
\      "alternate": "web/{}.ex",
\    }
\  },
\  "mix.exs": {
\    "lib/*.ex": { "alternate": "test/{}_test.exs" },
\    "test/*_test.exs": { "alternate": "lib/{}.ex" }
\  }
\}
noremap <leader>ec :Econtroller<Space>
noremap <leader>em :Emodel<Space>
noremap <leader>et :Etemplate<Space>
noremap <leader>eT :Etest<Space>
noremap <leader>ev :Eview<Space>
noremap <leader>a  :A<CR>

" update the cwd to the git project root as we move around the buffers
" http://inlehmansterms.net/2014/09/04/sane-vim-working-directories/
"
" set working directory to git project root
" or directory of current file if not git project
" function! SetProjectRoot()
"   " default to the current file's directory
"   lcd %:p:h
"   let git_dir = system("git rev-parse --show-toplevel")
"   " See if the command output starts with 'fatal' (if it does, not in a git repo)
"   let is_not_git_dir = matchstr(git_dir, '^fatal:.*')
"   " if git project, change local directory to git project root
"   if empty(is_not_git_dir)
"     lcd `=git_dir`
"   endif
" endfunction
" autocmd BufRead * call SetProjectRoot()
