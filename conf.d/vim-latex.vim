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
