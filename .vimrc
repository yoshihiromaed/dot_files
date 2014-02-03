"インクリメンタルサーチ
set incsearch
"検索ハイライト
set hlsearch
"行番号
set number
"シンタックスに色をつける
syntax on
"カーソルを行頭、行末で止まらないようにする
set nocompatible
set whichwrap=b,s,h,l,<,>,[,]
let loaded_gzip = 1
set fileencodings=utf-8
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
"タブの切り替え
nmap <C-A>	gt
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
NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'Shougo/unite-ssh'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'yuratomo/w3m.vim'
filetype plugin indent on

if has('gui_running')
	call vimfiler#set_execute_file('vim', 'gvim')
	call vimfiler#set_execute_file('txt', 'gvim')
	call vimfiler#set_execute_file('tex', 'gvim')
else
	call vimfiler#set_execute_file('vim', 'vim')
	call vimfiler#set_execute_file('txt', 'vim')
	call vimfiler#set_execute_file('tex', 'vim')
endif

""""""""""""""""""""""""""
"vim-latex
"""""""""""""""""""""""""
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
	let g:Tex_CompileRule_pdf = 'pdfplatex.bat $*'
	let g:Tex_CompileRule_ps = ''
	let g:Tex_CompileRule_dvi = ''
	let g:Tex_BibtexFlavor = ''
	let g:Tex_MakeIndexFlavor = ''
	let g:Tex_UseEditorSettingInDVIViewer = 1
	let g:Tex_ViewRule_pdf = 'C:\Program Files\Adobe\Reader 10.0\Reader\AcroRd32.exe'
	let g:Tex_ViewRule_ps = 'C:\Program Files\gs\gs9.07\bin\gswin32.exe'
	let g:Tex_ViewRule_dvi = 'C:\Program Files\gs\gs9.07\bin\gswin32.exe'
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

"neocomplcache
"Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
 let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
	\ 'default' : ''
	\ }
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" tab setting
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
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ
