"インクリメンタルサーチ
set incsearch
"検索ハイライト
set hlsearch
"行番号
set number
"シンタックスに色をつける
syntax on
" .vimrcを開く
nnoremap <Space>.  :<C-u>edit $MYVIMRC<CR>
" source ~/.vimrc を実行する。
nnoremap <Space>,  :<C-u>source $MYVIMRC<CR> 
" 前のバッファ、次のバッファ、バッファの削除、バッファのリスト
nnoremap <silent><Space>b    :bp<CR>
nnoremap <silent><Space>n    :bn<CR>
nnoremap <silent><Space>k    :bd<CR>
" ファイル保存:バッファ変更時のみ保存 
nnoremap <silent><Space>s    :<C-u>update<CR> 

"vimfiler setting
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_edit_action = 'tabopen'
" ---  ファイラーを起動 ---
nnoremap <silent><Space>j    :VimFilerBufferDir<CR>

let g:unite_source_file_mru_limit = 300
" 最近使ったファイル
nnoremap <silent><Space>m    :Unite file_mru<CR>
" バッファリスト
nnoremap <silent><Space>l    :Unite buffer<CR>

""""""""""""""""""""""""""""""
"挿入モード時、ステータスラインの色を変更
"start
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

if has('unix') && !has('gui_running')
  " ESC後にすぐ反映されない対策
  inoremap <silent> <ESC> <ESC>
endif
""""""""""""""""""""""""""""""
"挿入モード時、ステータスラインの色を変更
"end
""""""""""""""""""""""""""""""
set nocompatible
filetype plugin indent off
 
if has('vim_starting')
	if has('win32') || has('win64')
		set runtimepath+=~/vimfiles/bundle/neobundle.vim/
		call neobundle#rc(expand('~/vimfiles/bundle/'))
	else
		set runtimepath+=~/.vim/bundle/neobundle.vim/
		call neobundle#rc(expand('~/.vim/bundle/'))
	endif
endif
 
"NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
"以下、インストールするプラグインのリポジトリを必要に応じて追記
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'sandeepcr529/Buffet.vim'
NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
filetype plugin indent on

call vimfiler#set_execute_file('vim', 'gvim')
call vimfiler#set_execute_file('txt', 'gvim')

""""""""""""""""""""""""""
"vim-latex
"""""""""""""""""""""""""
filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FormatDependency_pdf = 'pdf'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
if has('win32') || has('win64')
	let g:Tex_CompileRule_pdf = '/usr/texbin/simpdftex platex --mode dvipdfmx --dvipdfmopts "-p a4" --maxpfb --extratexopts "-file-line-error -synctex=1" $*'
	let g:Tex_CompileRule_ps = '/usr/texbin/dvips -Ppdf -o $*.ps $*.dvi'
	let g:Tex_CompileRule_dvi = '/usr/texbin/platex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
	let g:Tex_BibtexFlavor = '/usr/texbin/pbibtex'
	let g:Tex_MakeIndexFlavor = '/usr/texbin/mendex $*.idx'
	let g:Tex_UseEditorSettingInDVIViewer = 1
	let g:Tex_ViewRule_pdf = '/usr/bin/open -a Skim.app'
	let g:Tex_ViewRule_ps = '/usr/bin/open'
	let g:Tex_ViewRule_dvi = '/usr/bin/open'
else
	let g:Tex_CompileRule_pdf = '/usr/texbin/simpdftex platex --mode dvipdfmx --dvipdfmopts "-p a4" --maxpfb --extratexopts "-file-line-error -synctex=1" $*'
	let g:Tex_CompileRule_ps = '/usr/texbin/dvips -Ppdf -o $*.ps $*.dvi'
	let g:Tex_CompileRule_dvi = '/usr/texbin/platex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
	let g:Tex_BibtexFlavor = '/usr/texbin/pbibtex'
	let g:Tex_MakeIndexFlavor = '/usr/texbin/mendex $*.idx'
	let g:Tex_UseEditorSettingInDVIViewer = 1
	let g:Tex_ViewRule_pdf = '/usr/bin/open -a Skim.app'
	let g:Tex_ViewRule_ps = '/usr/bin/open'
	let g:Tex_ViewRule_dvi = '/usr/bin/open'
endif
