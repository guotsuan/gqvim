"  {{{   Basic 
"  
    set nocompatible
    filetype off
    " old pathogen system
    "call pathogen#infect() 

    " new vundle system
    set rtp+=~/.vim/bundle/vundle
    set rtp+=~/.vim/bundle/vim-pathogen
    call vundle#rc()

    set autochdir
    set iskeyword+=_,$,@,%,# " none of these are word dividers
    "set dict+=/usr/share/dict/british
    "let loaded_snips = 1
    execute pathogen#infect('mybundle/{}')


"  }}}

" {{{ Bundles

Bundle 'gmarik/vundle'
Bundle 'tomasr/molokai'
Bundle 'Indent-Guides'

Bundle 'L9'
Bundle 'FuzzyFinder'

"Surround
Bundle 'tpope/vim-surround'
Bundle 'CmdlineComplete'
Bundle 'Lokaltog/powerline'
Bundle 'Lokaltog/vim-easymotion'

"Nerdcommenter"
Bundle 'scrooloose/nerdcommenter'
Bundle 'majutsushi/tagbar'
"Bundle 'Vim-JDE'
"
Bundle 'matchit.zip'
Bundle 'fisadev/fisa-vim-colorscheme'
Bundle 'fisadev/FixedTaskList.vim'
Bundle 'kien/tabman.vim'
Bundle 'klen/python-mode'

Bundle 'Conque-Shell'
Bundle 'Decho'

Bundle 'xolox/vim-reload'
Bundle 'xolox/vim-shell'


Bundle 'Shougo/vimproc'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neosnippet'

Bundle 'honza/snipmate-snippets'
Bundle 'VOoM'

Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-scriptease'
Bundle 'tpope/vim-pathogen'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'

Bundle 'davidhalter/jedi-vim'

Bundle 'now/vim-quit-if-only-quickfix-buffer-left'

Bundle 'vim-scripts/Wombat'

Bundle 'mbbill/undotree'

Bundle 'kien/ctrlp.vim'
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'



""}}}

"  {{{ General

    set ignorecase

    filetype plugin indent on

    syntax on

    set clipboard=unnamed 
    "share clipboard with system" 

    set wildmenu "turn on command line completion wild style"

    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,
		 \*.jpg,*.gif,*.png

    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,

    " for tab
    set expandtab
    set tabstop=8
    set softtabstop=4
    set shiftwidth=4
    "set nohls

    " backspace
    set backspace=indent,eol,start

    set updatetime=500
" }}}

" {{{ I18n
    set fileencodings=utf-8,prc,taiwan,enc-cn,enc-tw,gbk,gb2312,big5,ansi
    set fileencoding=utf-8
    set encoding=utf-8
    set termencoding=utf-8
    set fileformats=unix,dos

" }}}

" {{{ UI

    if &term =~? 'xterm\|urxvt\|screen-256\|screen'
        let &t_Co=256
        "colorscheme fisa
        colorscheme molokai
    else
        colorscheme delek
    endif
    if has("gui_running")
        "colorscheme wombat
        colorscheme molokai
        set cursorcolumn 
        set cursorline 
        set lines=60 
        set columns=110
        "set guifont=Consolas\ 12
        "set guifontwide=Microsoft\ Yahei\ 9
    endif

    set laststatus=2
    set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
    set showtabline=2  " 0, 1 or 2; when to use a tab pages line
    set tabline=%!MyTabLine()  " custom tab pages line

    set guitablabel=%{GuiTabLabel()}


    "set incsearch

    set lazyredraw " do now redraw while runing macros

    set nolist " wo do what o show tabs, to ensure we get them out of my files

    "set listchars=tab:ß⌂,trail:•,nbsp:◊,extends:►,precedes:◄ " show tabs and trailing
    "set listchars=trail:•,nbsp:◊,extends:►,precedes:◄

    set matchtime=5 " how many tenths of a second to blink 
		    " matching brackets for
    set nostartofline " leave my cursor where it was

    set ruler 

    set showcmd

    set showmatch 
    hi MatchParen ctermbg=blue guibg=lightblue
    hi MatchParen ctermfg=yellow guifg=yellow

    function MyTabLine() " {{{2
      let s = '' " complete tabline goes here
      " loop through each tab page
      for t in range(tabpagenr('$'))
	" set highlight for tab number and &modified
	let s .= '%#TabLineSel#'
	" set the tab page number (for mouse clicks)
	let s .= '%' . (t + 1) . 'T'
	" set page number string
	let s .= t + 1 . ':'
	" get buffer names and statuses
	let n = ''  "temp string for buffer names while we loop and check buftype
	let m = 0  " &modified counter
	let bc = len(tabpagebuflist(t + 1))  "counter to avoid last ' '
	" loop through each buffer in a tab
	for b in tabpagebuflist(t + 1)
	  " buffer types: quickfix gets a [Q], help gets [H]{base fname}
	  " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
	  if getbufvar( b, "&buftype" ) == 'help'
	    let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
	  elseif getbufvar( b, "&buftype" ) == 'quickfix'
	    let n .= '[Q]'
	  else
	    let n .= pathshorten(bufname(b))
	  endif
	  " check and ++ tab's &modified count
	  if getbufvar( b, "&modified" )
	    let m += 1
	  endif
	  " no final ' ' added...formatting looks better done later
	  if bc > 1
	    let n .= ' '
	  endif
	  let bc -= 1
	endfor
	" add modified label [n+] where n pages in tab are modified
	if m > 0
	  let s .= '[' . m . '+]'
	endif
	" select the highlighting for the buffer names
	" my default highlighting only underlines the active tab
	" buffer names.
	if t + 1 == tabpagenr()
	  let s .= '%#TabLine#'
	else
	  let s .= '%#TabLineSel#'
	endif
	" add buffer names
	let s .= n
	" switch to no underlining and add final space to buffer list
	let s .= '%#TabLineSel#' . ' '
      endfor
      " after the last tab fill with TabLineFill and reset tab page nr
      let s .= '%#TabLineFill#%T'
      " right-align the label to close the current tab page
      if tabpagenr('$') > 1
	let s .= '%=%#TabLineFill#%999Xclose'
      endif
      return s
    endfunction  
    "  2}}}

    function! GuiTabLabel() " {{{2
      let label = ''
      let bufnrlist = tabpagebuflist(v:lnum)
      " Add '+' if one of the buffers in the tab page is modified
      for bufnr in bufnrlist
	if getbufvar(bufnr, "&modified")
	  let label = '+'
	  break
	endif
      endfor
      " Append the tab number
      let label .= v:lnum.': '
      " Append the buffer name
      let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
      if name == ''
	" give a name to no-name documents
	if &buftype=='quickfix'
	  let name = '[Quickfix List]'
	else
	  let name = '[No Name]'
	endif
      else
	" get only the file name
	let name = fnamemodify(name,":t")
      endif
      let label .= name
      " Append the number of windows in the tab page
      let wincount = tabpagewinnr(v:lnum, '$')
      return label . '  [' . wincount . ']'
    endfunction " 2}}}

    set guitablabel=%{GuiTabLabel()}

" }}}

" {{{ Folding
    set foldenable
    set foldcolumn=4
    set foldmethod=marker
    set foldopen+=jump,insert

    function SimpleFoldText() " {
        return getline(v:foldstart).' '
    endfunction " }

    "set foldmarker={{{,}}}
    "set foldlevel=1000
    "set foldtext=SimpleFoldText()
    "set foldclose=all

" }}}

"  Plugins Settings   "  {{{ 

" Taglist Plugin   "  {{{2
let g:Tlist_Auto_Update = 1
  "  2}}}

" Taglist Plugin   "  {{{2
let g:Tlist_Auto_Update = 1
"let g:tagbar_ctags_bin = ctags
  "  2}}}
  "
" easytags plugin {{{2
"
 let g:easytags_dynamic_files=1
 let g:easytags_on_cursorhold=1
 let g:easytags_python_enable=1
 let g:easytags_by_filetype=1
 let g:easytags_auto_highlight=1
 let g:easytags_auto_update = 1
 let g:easytags_include_members =1   "  2}}}

" vim-latex     "  {{{2
 set grepprg=grep\ -nH\ $*
 let g:tex_flavor = "latex"     " 2}}}

" neosnippet     "  {{{2
    if has('conceal')
      set conceallevel=2 concealcursor=nc
    endif
 " 2}}}

"{{{2 nerd comment
"
let mapleader=","

"2}}}

" {{{2 FuzzyFinder
" keybinds see keybinds section

" 2}}}

" {{{2  neocomplcache
" Disable AutoComplPop.
"
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3

" enable fuzzy completion
let g:neocomplcache_enable_fuzzy_completion =1

" necomp locked if iminsert
"let g:neocomplcache_lock_iminsert = 0

let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_auto_select=0

let g:neocomplcache_disable_auto_complete =0

"let g:neocomplcache_vim_completefuncs.Ref = 'ref#complete'
let g:neocomplcache_enable_cursor_hold_i = 1
    

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
\ 'default' : '',
\ 'vimshell' : $HOME.'/.vimshell_hist',
\ 'scheme' : $HOME.'/.gosh_completions'
\ }

" Define keyword.

if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.lua= '[^. \t]\.\w*'


" Key bindings for neocomplcache


" 2}}}

" {{{2 delimitMate  
    
    "let delimitMate_autoclose=1
    "let delimitMate_expand_space = 0
    "let delimitMate_expand_cr = 1
    "let delimitMate_smart_quotes = 1
    "let delimitMate_balance_matchpairs = 1
    "let delimitMate_smart_matchpairs='^\%(\w\|\!\|£\|\$\|_\|["'']\s*\S\)'
    "let delimitMate_excluded_regions = "Comment,String"
    "let delimitMate_excluded_ft = "mail,txt,text"

    "au FileType python let b:delimitMate_quotes = "\" '"
    "au FileType python let b:delimitMate_nesting_quotes=['"']
    "au FileType c,perl,cpp let b:delimitMate_eol_marker =";"
    " because sometime delimitMate is not smart enough

"2}}}

" {{{2 auto-pairs is simple and used to replace dlimitMate
    "let g:AutoPairsFlyMode = 0
    "let g:AutoPairsShortcutBackInsert = '<Leader>b'
    "let g:AutoPairsMapCR = 0
    "let g:AutoPairsShortcutFastWrap = '<Leader>e'
    "let g:AutoPairsShortcutToggle = '<Leader>p'
    "let g:AutoPairsShortcutJump = '<Leader>n'

    

"2}}}

     "lua ftp-plugin.vim  "  {{{2
      let g:lua_complete_omni=1
      let g:lua_complete_dynamic=0
       "let g:lua_check_synatx=
      "  2}}} 

" Plugin jedi-vim"{{{
let g:jedi#pydoc = "K"
let g:jedi#rename_command = "<Leader>f"
let g:jedi#autocompletion_command = "<C-Space>"
let g:pymode_run_key = "<Leader>r""}}}
let g:jedi#popup_on_dot=0
let g:jedi#popup_select_first = 0

if !exists('g:neocomplcache_force_omni_patterns')
    let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'

" }}}

"Key Bindings {{{

" for paste  {{{2
"map <F9> :set paste<CR>
"map <F10> :set nopaste<CR>
"imap <F9> <C-O>:set paste<CR>
"imap <F9> <nop>
"set pastetoggle=<F9>

" 2}}}

"too slow
"map <F3> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
nmap <F3> <ESC>:w<cr>:!make<cr>
nmap <F6> :cn<cr>
nmap <F5> :lmake<cr>
nmap <F8> :set list!<cr>
nmap <F2> :UpdateTags<cr>
nnoremap <silent> <F4> :TagbarToggle<CR>

nmap <leader>u :UndotreeToggle<CR>

"inoremap <Leader><Space>  <Esc>i<Space><Esc>la<Space>
"nnoremap <Leader><Space>  <Esc>i<Space><Esc>la<Space><Esc>
"nnoremap <Leader><Space>+  <Esc>i<Space><Esc>la<Space><Esc>
nnoremap <Leader><Space> :call pyformat#adjustspace()<CR>
nnoremap <Leader>s :call gqutils#selindent()<CR>

inoremap "" "
nnoremap "" i"<ESC>
nnoremap "A a"<ESC>

inoremap '' '
nnoremap '' i'<ESC>
nnoremap 'A a'<ESC>

inoremap {{ {
inoremap }} }
nnoremap {{ i{<ESC>
nnoremap }} a}<ESC>
nnoremap }i i}<ESC>

inoremap [[ [
inoremap ]] ]
nnoremap [[ i[<ESC>
nnoremap ]] a]<ESC>
nnoremap ]i i]<ESC>

inoremap (( (
inoremap )) )
nnoremap (( i(<ESC>
nnoremap )) a)<ESC>
nnoremap )i i)<ESC>

nnoremap <Leader>{  :call gqutils#addcomment(nr2char(getchar()), 1)<CR>
nnoremap <Leader>}  :call gqutils#addcomment(nr2char(getchar()), 0)<CR>
"nnoremap c{ gqcomment#,
"
"==============================================================================
 "neocomplcache keybinds  "{{{2

" Supertab

" not worked in previous, tested no good
"imap <expr><TAB> neosnippet#expandable() ?
 "\ "\<Plug>(neosnippet_expand_or_jump)"
 "\: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable() ?
 "\ "\<Plug>(neosnippet_expand_or_jump)"
 "\: "\<TAB>"

" work good, but no most efficent way
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
smap  <Tab>  <right><Plug>(neosnippet_expand_or_jump)
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

"inoremap <expr><C-e>     neocomplcache#complete_common_string()

" Plugin key-mappings.
inoremap <expr><C-g> neocomplcache#undo_completion()
"inoremap <expr><C-l> neocomplcache#complete_common_string()
"
imap <C-l>  <Plug>(neocomplcache_start_unite_complete)
imap <C-q>  <Plug>(neocomplcache_start_unite_quick_match)

inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

inoremap <expr><silent> <CR> My_cr_function()

function! My_cr_function()
    return pumvisible() ? neocomplcache#close_popup() . "\<CR>": "\<CR>"
endfunction

" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-R>AutoClose#Backspace()\<CR>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"




"2}}}

" fuzzyfinder keybinds"{{{2
  let g:fuf_modesDisable = []
  let g:fuf_mrufile_maxItem = 400
  let g:fuf_mrucmd_maxItem = 400
  nnoremap <silent> sj     :FufBuffer<CR>
  nnoremap <silent> sk     :FufFileWithCurrentBufferDir<CR>
  nnoremap <silent> sK     :FufFileWithFullCwd<CR>
  nnoremap <silent> s<C-k> :FufFile<CR>
  nnoremap <silent> sl     :FufCoverageFileChange<CR>
  nnoremap <silent> sL     :FufCoverageFileChange<CR>
  nnoremap <silent> s<C-l> :FufCoverageFileRegister<CR>
  nnoremap <silent> sd     :FufDirWithCurrentBufferDir<CR>
  nnoremap <silent> sD     :FufDirWithFullCwd<CR>
  nnoremap <silent> s<C-d> :FufDir<CR>
  nnoremap <silent> sn     :FufMruFile<CR>
  nnoremap <silent> sN     :FufMruFileInCwd<CR>
  nnoremap <silent> sm     :FufMruCmd<CR>
  nnoremap <silent> su     :FufBookmarkFile<CR>
  nnoremap <silent> s<C-u> :FufBookmarkFileAdd<CR>
  vnoremap <silent> s<C-u> :FufBookmarkFileAddAsSelectedText<CR>
  nnoremap <silent> si     :FufBookmarkDir<CR>
  nnoremap <silent> s<C-i> :FufBookmarkDirAdd<CR>
  nnoremap <silent> st     :FufTag<CR>
  nnoremap <silent> sT     :FufTag!<CR>
  nnoremap <silent> s<C-]> :FufTagWithCursorWord!<CR>
  nnoremap <silent> s,     :FufBufferTag<CR>
  nnoremap <silent> s<     :FufBufferTag!<CR>
  vnoremap <silent> s,     :FufBufferTagWithSelectedText!<CR>
  vnoremap <silent> s<     :FufBufferTagWithSelectedText<CR>
  nnoremap <silent> s}     :FufBufferTagWithCursorWord!<CR>
  nnoremap <silent> s.     :FufBufferTagAll<CR>
  nnoremap <silent> s>     :FufBufferTagAll!<CR>
  vnoremap <silent> s.     :FufBufferTagAllWithSelectedText!<CR>
  vnoremap <silent> s>     :FufBufferTagAllWithSelectedText<CR>
  nnoremap <silent> s]     :FufBufferTagAllWithCursorWord!<CR>
  nnoremap <silent> sg     :FufTaggedFile<CR>
  nnoremap <silent> sG     :FufTaggedFile!<CR>
  nnoremap <silent> so     :FufJumpList<CR>
  nnoremap <silent> sp     :FufChangeList<CR>
  nnoremap <silent> sq     :FufQuickfix<CR>
  nnoremap <silent> sy     :FufLine<CR>
  nnoremap <silent> sh     :FufHelp<CR>
  nnoremap <silent> se     :FufEditDataFile<CR>
  nnoremap <silent> sr     :FufRenewCache<CR>
  "2}}}

"indent Guide setting {{{
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=lightgrey ctermbg=4
"}}}

" ctrlp plugin keymap "{{{
"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

"}}}

"}}}

"Auto Command {{{
"

au BufRead,Bufnew *.java,*.c,*.cpp
    \ let g:easytags_include_members=1

" for lejos 
"==================================

 "let g:neocomplcache_include_paths={'java':'/home/dccf87/usr/lejos_nxj/lib/nxt,.'} |
 let g:neocomplcache_include_patterns={'java':'^\s*import'}
 
au BufRead,BufNew */lejos/*.java
    \ let b:classpath="/home/dccf87/usr/lejos_nxj/lib" |
    \ let g:vjde_lib_path="/home/dccf87/usr/lejos_nxj/lib/nxt/classes.jar" |
    \ set makeprg=nxjc\ % |
    \ let g:vjde_javadoc_path="/home/dccf87/usr/lejos_nxj/docs/nxt/"   |
    \ cmap up !nxj -b %:r |
    \ setlocal path+=/home/dccf87/usr/lejos_nxj/lib/nxt |
    \ set tags=./tags,/home/dccf87/usr/lejos_nxj/lib/nxt/tags |
    \ let g:neocomplcache_include_paths={'java':'/home/dccf87/usr/lejos_nxj/lib/nxt,.'} 

	"g:vjde_doc_gui_height	 height of the window
	"g:vjde_doc_gui_width	width of the window
	"g:vjde_doc_delay	once a item selected ,delay how long.

au BufEnter,BufWrite *.java 
    \ if getline(1) =~ "lejos" |
        \ let b:classpath="/home/dccf87/usr/lejos_nxj/lib" |
        \ let g:vjde_lib_path="/home/dccf87/usr/lejos_nxj/lib/nxt/classes.jar" |
        \ set makeprg=nxjc\ % |
        \ let g:vjde_javadoc_path="/home/dccf87/usr/lejos_nxj/docs/nxt" |
        \ cmap up !nxj -b %:r |
        \ setlocal path+=/home/dccf87/usr/lejos_nxj/lib/nxt |
        \ set tags=./tags,/home/dccf87/usr/lejos_nxj/lib/nxt/tags |
        \ let g:neocomplcache_include_paths={'java':'/home/dccf87/usr/lejos_nxj/lib/nxt,.'} |
    \ endif

au BufEnter,BufWrite *.java 
    \ if getline(1) =~ "pc lejos" |
        \ let g:vjde_lib_path="/home/dccf87/usr/lejos_nxj/lib/pc/pccomm.jar" |
        \ set makeprg=nxjpcc\ % |
        \ let g:vjde_javadoc_path="/home/dccf87/usr/lejos_nxj/docs/pc" |
        \ setlocal path+=/home/dccf87/usr/lejos_nxj/lib/pc |
        \ cmap up !nxjpc %:r |
        \ let g:neocomplcache_include_paths={'java':'/home/dccf87/usr/lejos_nxj/lib/pc,.'} |
    \ endif

    "\ set tags=~/tags,/home/dccf87/usr/lejos_nxj/lib/nxt/tags |
"============================
"
au BufReadPost * if getline(1) =~ "mutt" | setf muttrc | endif

au FileType python setlocal list
au FileType python setlocal listchars=tab:ß⌂,trail:•,nbsp:◊,extends:►,precedes:◄ 


"omin completion
"==========================================================
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType xml setlocal omnifunc=xmlcomplete#completeTags
"autocmd FileType lua setlocal omnifunc=luacomplete#Complete
"autocmd FileType java setlocal omnifunc=javacomplete#Complete
"autocmd FileType java setlocal omnifunc=eclim#java#complete#CodeComplete
autocmd FileType java setlocal omnifunc=VjdeCompletionFun0

"============================================================
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
                \Filetypeif &omnifunc == "" |
                \Filetypeifsetlocal omnifunc=syntaxcomplete#Complete |
                \Completeendif
endif

autocmd Filetype java,c,cpp 
        \ inoremap ;; <end>;|
        \ imap ;] <end>;<ESC>]}a|
        \ nnoremap ;; <end>a;<ESC>

"autocmd FileType java,javascript,html,css imap  ; <C-R>=My_appendSemicolon(0,0)<CR>
"autocmd FileType java,javascript,html,css map  ; i;<esc>
"autocmd FileType java,javascript,html,css map  ;; i<C-R>=My_appendSemicolon(2,2)<CR><esc>
"autocmd FileType java,javascript,html,css imap  ;; <C-R>=My_appendSemicolon(2,0)<CR><esc>a

"autocmd BufEnter * call DoWordComplete() 
"

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif 
"autocmd BufLeave * if pumvisible() == 0|pclose|endif
" lua "{{{
" =========================================

au Filetype lua 
    \ setlocal path+=/usr/share/awesome/lib |
    \ set suffixesadd=.lua |
    \ imap <F3> <C-o>:call xolox#lua#help()<CR> |
    \ nmap <F3> <C-o>:call xolox#lua#help()<CR> 
"}}} 
" }}}

" Vim command character"{{{

cmap tn tabnew
cmap vte Vtabedit
cmap mru FufMruFile
ca w!! w !sudo tee "%" >/dev/null
ca W w !sudo tee % > /dev/null
"}}}

