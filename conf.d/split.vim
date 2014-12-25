"""""""""""""""""""""""""""""""""
"split
"""""""""""""""""""""""""""""""""
nnoremap s <Nop>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>

nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sw <C-w>w

nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sr <C-w>r

nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap s= <C-w>=
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

nnoremap sT :<C-u>Unite tab<CR>

"""""""""""""""""""""""""""""""""
" Windows
"""""""""""""""""""""""""""""""""
" $VIM/dot_files/.vimrc
" $VIM/dot_files/conf.d/neobundle.vim
" $VIM/dot_files/conf.d/split.vim
" $VIM/dot_files/conf.d/tab.vim
" $VIM/dot_files/conf.d/vim-latex.vim
"
"""""""""""""""""""""""""""""""""
" Mac / Linux 
"""""""""""""""""""""""""""""""""
" ~/dot_files/.vimrc
" ~/dot_files/conf.d/neobundle.vim
" ~/dot_files/conf.d/split.vim
" ~/dot_files/conf.d/tab.vim
" ~/dot_files/conf.d/vim-latex.vim
