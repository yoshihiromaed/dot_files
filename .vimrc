"incremental search
set incsearch
"high light search
set hlsearch
"case-insensitive search
set ignorecase
"no case-insensitive search, when search in capital letters
set smartcase
"line number
set number
"color up syntax
syntax on
"no Vi compatible
set nocompatible
"wrap around the start and end of individual lines
set whichwrap=b,s,h,l,<,>,[,]
"not load gzip plugin
let loaded_gzip = 1
"file encode: utf-8
set fileencodings=utf-8
"open .vimrc
nnoremap <Space>.  :<C-u>edit $MYVIMRC<CR>
"execute source ~/.vimrc
nnoremap <Space>,  :<C-u>source $MYVIMRC<CR> 
"previous buffer
nnoremap <silent><Space>b    :bp<CR>
"next buffer
nnoremap <silent><Space>n    :bn<CR>
"delete buffer
nnoremap <silent><Space>k    :bd<CR>
"save current buffer 
nnoremap <silent><Space>s    :<C-u>update<CR> 


""""""""""""""""""""""""""""""
"change status line's color, when insert mode
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
	augroup InsertHook
	autocmd!
	autocmd InsertEnter * call s:StatusLine('Enter')
	autocmd InsertLeave * call s:StatusLine('Leave')
	augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
	if a:mode == 'Enter'
		silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
		silent exec g:hi_insert
	else
		highlight clear StatusLine
		silent exec s:slhlcmd
	endif
endfunction

function! s:GetHighlight(hi)
	redir => hl
	exec 'highlight '.a:hi
	redir END
	let hl = substitute(hl, '[\r\n]', '', 'g')
	let hl = substitute(hl, 'xxx', '', '')
	return hl
endfunction

" ESC後にすぐ反映されない対策
if has('unix') && !has('gui_running')
	inoremap <silent> <ESC> <ESC>
endif

set rtp+=$HOME/dot_files/
runtime! conf.d/*.vim
