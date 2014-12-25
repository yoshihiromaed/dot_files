""""""""""""""""""""""""""
" tab setting
""""""""""""""""""""""""""
"anywhere SID
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 "always display tabline

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

"tc: creat new tab to the most right
map <silent> [Tag]c :tablast <bar> tabnew<CR>
"tx: close tab
map <silent> [Tag]x :tabclose<CR>
"tn: move next tab
map <silent> [Tag]n :tabnext<CR>
"tp: move previous tab
map <silent> [Tag]p :tabprevious<CR>

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
