"
" Mouse support
"
set mouse=r

"
" VIM color theme
"
color rober

"
" Pathogen
"
execute pathogen#infect()

"
" Using EasyColour
"
"set background=dark " Change to light if you want the light variant
"colorscheme rcano " Change to your preferred colour scheme

"
" C indenting and formating
"
set ts=4
set sw=4
"set noexpandtab
set expandtab
set number
set numberwidth=4
set hls
let c_space_errors=1 
set fileformat=unix
set fileformats=unix,dos
set modeline

"
" 100 column highlight
"
"highlight OverLength ctermbg=yellow ctermfg=white guibg=#592929
"match OverLength /\%101v.\+/

"
" Folding support
"
" FIXME!!! Split is not working with folding....
"
set foldcolumn=2
set fillchars=
set foldtext=MyFoldText()
function MyFoldText()
	let line = getline(v:foldstart)
	let sub = substitute(line, '/\*\|\*/\|{{{\d=', '', 'g')
	return v:folddashes . sub
endfunction
set foldmarker=#if,#endif
set foldmethod=marker
"au BufWinLeave * silent mkview
"au BufWinEnter * silent loadview

"
" Taglist plugin
"
"let Tlist_Compact_Format=1
"let Tlist_Show_One_File=1
"let Tlist_WinWidth=35
"let Tlist_Sort_Type="name"
"let Tlist_Exit_OnlyWindow=1
"let Tlist_Ctags_Cmd='ctags'

"let Tlist_Auto_Open=1		" Activates for all the file types. Instead,
							" filter only the ones we want
"au VimEnter *.c TlistToggle
"au VimEnter *.h TlistToggle
"au VimEnter *.cc TlistToggle
"au VimEnter *.cpp TlistToggle

"
" TagBar plugin
"
"map <F8> :TagbarToggle<CR>
"au VimEnter *.c TagbarToggle
"au VimEnter *.h TagbarToggle
"au VimEnter *.cc TagbarToggle
"au VimEnter *.cpp TagbarToggle

"
" C Scope
"
if filereadable("cscope.out")
    cs add cscope.out
    " else add database pointed to by environment
 elseif $CSCOPE_DB != ""
     cs add $CSCOPE_DB
endif

"
" Use both cscope and ctags
"
set cscopetag

" Insert a comment(in line).
" map q ^[0i/*^[$a*/
" Delete a comment (in line).
" map g ^[0xx^[$xx 

"
" Search in files
"
set grepprg=ack-grep\ --cpp\ --cc\ --perl\ --python\ --make
nmap <F4> :grep <C-R>=expand("<cword>")<CR><CR>
map <F5> :cprev<CR>
map <F6> :cnext<CR>
map <F7> :botright cwindow<CR>

"
" GLSL
"
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl

"
" Filetype plugins support
"
filetype plugin indent on

"
" Markdown folding off and enable spell checking
"
let g:vim_markdown_folding_disabled = 1
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_gb
