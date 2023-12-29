"incremental search
set incsearch
"high light search
set hlsearch
"case-insensitive search
set ignorecase
"no case-insensitive search when search in capital letters
set smartcase
"line number
set number
"color up syntax
syntax on
"no Vi compatible
set nocompatible
"beep off
set visualbell t_vb=
set noerrorbells
"wrap around the start and end of individual lines
set whichwrap=b,s,h,l,<,>,[,]
"not load gzip plugin
let loaded_gzip = 1
"vim encoding setting
set encoding=utf-8
"file encoding setting
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8
set fileformats=unix,dos,mac
"open .vimrc
nnoremap <Space>.  :<C-u>edit $MYVIMRC<CR>
"execute source ~/.vimrc
nnoremap <Space>,  :<C-u>source $MYVIMRC<CR> 

"statusline
set statusline=%F%m%r%h%w%=[ENC=%{&fileencoding}]\ [FF=%{&ff}]\ [L=%l/%L]\ %{fugitive#statusline()} 

""""""""""""""""""""""""""""""
"change status line's color when insert mode
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('win32') || has('win64')
	set guifont=Consolas:h12:cANSI
	set guifontwide=MS_Gothic:h12:b:cSHIFTJIS
endif

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
"if has('unix') && !has('gui_running')
"	inoremap <silent> <ESC> <ESC>
"endif

if has('win32') || has('win32')
	set rtp+=$VIM/dot_files/
	runtime! conf.d/*.vim
else
	set rtp+=$HOME/dot_files/
	runtime! conf.d/*.vim
endif

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
