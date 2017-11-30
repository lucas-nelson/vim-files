" nice colours
colorscheme torte
" make the colorcolumn dark grey
highlight ColorColumn guibg=#222222
" make the line numbers dark grey
highlight LineNr gui=NONE guifg=#222222 guibg=NONE
" nice font
set guifont=Fira\ Mono:h13
" kill the gui scrollbars
set guioptions-=r
set guioptions-=L

" get rid of the annoying ruby doco popus
" https://stackoverflow.com/questions/871465/i-get-this-window-while-editing-ruby-files-in-vim-what-is-it
autocmd FileType ruby,eruby set noballooneval

