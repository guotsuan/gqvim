"  {{{   Basic 
"  
    set nocompatible
    filetype indent on
    filetype plugin on
    syntax on
    call pathogen#infect() 
    set autochdir
    set iskeyword+=_,$,@,%,# " none of these are word dividers
    "set dict+=/usr/share/dict/british


"  }}}

"  {{{ General

    set ignorecase

    "set clipboard=unnamed 
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
    if has("gui_running")
	colorscheme evening
	set cursorcolumn 
	set cursorline 
        set lines=60 
        set columns=110
    endif

    set laststatus=2
    set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
    set showtabline=2  " 0, 1 or 2; when to use a tab pages line
    set tabline=%!MyTabLine()  " custom tab pages line

    set guitablabel=%{GuiTabLabel()}


    "set incsearch

    set lazyredraw " do now redraw while runing macros

    set list " wo do what o show tabs, to ensure we get them out of my files

    set listchars=tab:>-,trail:-,nbsp:_,extends:>,precedes:< " show tabs and trailing

    set matchtime=5 " how many tenths of a second to blink 
		    " matching brackets for
    set nostartofline " leave my cursor where it was

    set ruler 

    set showcmd

    set showmatch 

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
    "set foldmarker={{{,}}}
    "set foldlevel=1000
    set foldopen=block,hor,mark,percent,quickfix,tag

    function SimpleFoldText() " {
        return getline(v:foldstart).' '
    endfunction " }

    "set foldtext=SimpleFoldText()
    "set foldclose=all

" }}}

" {{{ Plugins Settings

"{{{2 nerd comment
"
let mapleader=","

"2}}}

" {{{2 FuzzyFinder
" keybinds see keybinds section

" 2}}}

" {{{2  neocomplcache
" Disable AutoComplPop.
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
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_auto_select=0
"let g:neocomplcache_enable_cursor_hold_i = 1
    

"let g:neocomplcache_delimiter_patterns= {}

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
\ 'default' : '',
\ 'vimshell' : $HOME.'/.vimshell_hist',
\ 'scheme' : $HOME.'/.gosh_completions'
\ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()


let g:neocomplcache_disable_auto_complete =0
" Key bindings for neocomplcache


" 2}}}

"{{{2 Latex Suite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

" 2}}}

" {{{2 delimitMate  
    
    let delimitMate_autoclose=1
    let delimitMate_expand_space = 1
    let delimitMate_expand_cr = 1
    let delimitMate_smart_quotes = 1
    let delimitMate_balance_matchpairs = 1
    let delimitMate_smart_matchpairs='^\%(\w\|\!\|£\|\$\|_\|["'']\s*\S\)'
    let delimitMate_excluded_regions = "Comment,String"
    let delimitMate_excluded_ft = "mail,txt,text"
"2}}}
    
 "lua.vim
  let g:lua_complete_omni=1

  " TagExplorer
  let TE_Ctags_Path='/usr/bin/ctags'

" }}}


"Key Bindings {{{

" for paste {{{2
map <F10> :set paste<CR>
map <F11> :set nopaste<CR>
imap <F10> <C-O>:set paste<CR>
imap <F11> <nop>
set pastetoggle=<F11> 
"2}}}

"too slow
"map <F3> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
nmap <F6> :cn<cr>
nmap <F5> :lmake<cr>
nmap <F8> :set list!<cr>
nmap <F2> :UpdateTags<cr>

"{{{2 neocomplcache keybinds
"

" AutoComplPop like behavior.

    " Maping Tab to neocomplcache
imap  <expr><Tab>  neocomplcache#sources#snippets_complete#expandable() ? 
      \ "\<Plug>(neocomplcache_snippets_expand)" : (pumvisible() ? "\<c-n>" : "\<Tab>")
smap  <Tab>  <right><Plug>(neocomplcache_snippets_jump)


inoremap <expr><c-e>     neocomplcache#complete_common_string()

imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)

inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string() 
imap <C-k> <Plug>(neocomplcache_start_unite_complete)
imap <C-q> <Plug>(neocomplcache_start_unite_quick_match)

"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" recommanded key mapping

" <CR>: close popup and save indent.
inoremap <expr><CR> neocomplcache#smart_close_popup()."\<C-R>=delimitMate#ExpandReturn()\<CR>"

" <TAB>: completion.

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"

inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-R>=delimitMate#BS()\<CR>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
"2}}}
"


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

"Auto Command {{{
au BufReadPost * if getline(1) =~ "mutt" | setf muttrc | endif

"if has("autocmd") && exists("+omnifunc")
    "autocmd Filetype *
		"\Filetypeif &omnifunc == "" |
		"\Filetypeifsetlocal omnifunc=syntaxcomplete#Complete |
		"\Completeendif
"endif

"omin completion
"
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#completeTags
autocmd FileType java setlocal omnifunc=javacomplete#Complete
"autocmd FileType java setlocal omnifunc=VjdeCompletionFun0

autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif


"autocmd FileType java,javascript,html,css imap  ; <C-R>=My_appendSemicolon(0,0)<CR>
"autocmd FileType java,javascript,html,css map  ; i;<esc>
"autocmd FileType java,javascript,html,css map  ;; i<C-R>=My_appendSemicolon(2,2)<CR><esc>
"autocmd FileType java,javascript,html,css imap  ;; <C-R>=My_appendSemicolon(2,0)<CR><esc>a

"autocmd BufEnter * call DoWordComplete() 
" }}}}

"indent Guide setting {{{
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=lightgrey ctermbg=4
"}}}



