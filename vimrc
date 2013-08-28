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
Bundle 'TeX-9'

Bundle 'L9'
Bundle 'FuzzyFinder'

"Surround
Bundle 'tpope/vim-surround'
Bundle 'CmdlineComplete'
"Bundle 'Lokaltog/powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'hsitz/VimOrganizer'

"Nerdcommenter"
Bundle 'scrooloose/nerdcommenter'
Bundle 'majutsushi/tagbar'
Bundle 'bling/vim-airline'
"Bundle 'Vim-JDE'
"
Bundle 'matchit.zip'
Bundle 'fisadev/fisa-vim-colorscheme'
Bundle 'fisadev/FixedTaskList.vim'
Bundle 'kien/tabman.vim'
Bundle 'klen/python-mode'
Bundle 'tpope/vim-fugitive'

Bundle 'Conque-Shell'
Bundle 'Decho'

Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-reload'
Bundle 'xolox/vim-shell'
"Bundle 'xolox/vim-lua-ftplugin'
Bundle  'terryma/vim-multiple-cursors'


Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'Shougo/vimproc'
" for system without lua
"Bundle 'Shougo/neocomplcache'
" for system with lua
Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/neosnippet'
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'Shougo/vimshell'

"cause duplicate
"Bundle 'honza/vim-snippets'
Bundle 'VOoM'

Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-scriptease'
Bundle 'tpope/vim-pathogen'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'
Bundle 'svermeulen/vim-easyclip'

Bundle 'davidhalter/jedi-vim'

Bundle 'now/vim-quit-if-only-quickfix-buffer-left'

Bundle 'vim-scripts/Wombat'
Bundle 'bash-support.vim'
Bundle 'junegunn/vim-easy-align'

Bundle 'mbbill/undotree'
Bundle 'kien/ctrlp.vim'


"Bundle 'Yggdroot/indentLine'

Bundle 'plasticboy/vim-markdown'
Bundle 'mkitt/markdown-preview.vim'
"Bundle 'scrooloose/syntastic'
Bundle 'petRUShka/vim-opencl'

""}}}

"  {{{ General

let g:powerline_loaded = 1
"let g:loaded_airline = 1

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
set expandtab
set smarttab
set tw=0
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
    set guioptions-=T
    set columns=110
    if !has("mac")
        set guifont=Consolas\ 12
        set guifontwide=Microsoft\ Yahei\ 9
    endif
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
hi ColorColumn term=underline ctermfg=blue ctermbg=yellow guifg=blue guibg=yellow

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
"
"vim airline {{{
let g:airline_enable_branch=1
let g:airline_enable_tagbar=1
let g:airline_detect_modified=1
let g:airline_detect_iminsert=1
let g:airline_theme='dark'

let g:airline_left_sep = '»'
"let g:airline_left_alt_sep = '▶'
let g:airline_right_sep = '«'
"let g:airline_right_alt_sep = '◀'
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_linecolumn_prefix = '␊ '
let g:airline_linecolumn_prefix = '␤ '
"let g:airline_linecolumn_prefix = '¶ '
let g:airline_branch_prefix = '⎇  '
"let g:airline_paste_symbol = 'ρ'
let g:airline_paste_symbol = 'Þ'
let g:airline_whitespace_symbol = 'Ξ'
 "let g:airline_paste_symbol = '∥'
 "
 "
 let g:airline_left_sep = '»'
 let g:airline_left_sep = '▶'
 let g:airline_right_sep = '«'
 let g:airline_right_sep = '◀'


"}}}
"
"YCM plugin    "{{{
"let g:ycm_add_preview_to_completeopt=1
let g:ycm_filetype_whitelist={'python': 1}
"}}}

"Ultisnips  "{{{

"if exists("g:loaded_neocomplete")
    let g:UltiSnipsExpandTrigger="<c-k>"
    let g:UltiSnipsJumpForwardTrigger="<c-k>"
    let g:UltiSnipsJumpBackwardTrigger="<c-j>"
"endif

"}}}

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
let g:tex_flavor = "pdflatex"     
let g:tex_synctex=1
let g:tex_fold_enabled = 1
"let g:tex_viewer = {'app': 'evince', 'target': 'pdf'}

" 2}}}

" neosnippet     "  {{{2
if has('conceal')
  set conceallevel=2 concealcursor=nc
endif
 " 2}}}

"{{{2 nerd comment
"
let mapleader=","
let g:NERDCustomDelimiters = {
        \ 'lisp': {'left': ';', 'leftAlt': ';', 'rightAlt': ';'}
    \}

"2}}}

" {{{2 FuzzyFinder
" keybinds see keybinds section

" 2}}}

" {{{2  neocomplcache
" Disable AutoComplPop.
"
let g:acp_enableAtStartup = 0
" Use neocomplcache.
"let g:neocomplcache_enable_at_startup = 0
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

" {{{2  neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" enable fuzzy completion
let g:neocomplete#enable_fuzzy_completion = 1

" necomp locked if iminsert
let g:neocomplete#enable_auto_select=0
let g:neocomplete#disable_auto_complete = 0

let g:neocomplete#enable_cursor_hold_i = 1
    

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
\ 'default' : '',
\ 'vimshell' : $HOME.'/.vimshell_hist',
\ 'scheme' : $HOME.'/.gosh_completions'
\ }

" Define keyword.
"
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.lua = '[^. \t]\.\w*'


" Key bindings for neocomplcache


" 2}}}

"lua ftp-plugin.vim  "  {{{2
let g:lua_complete_omni=1
let g:lua_complete_dynamic=0
"let g:lua_check_synatx=
"  2}}} 
"
" Pytho mode {{{
"
" python codes check
let g:pymode_lint=1
let g:pymode_lint_ignore="W402"
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_write=1
let g:pymode_lint_onfly=0
let g:pymode_lint_hold=0
let g:pymode_lint_signs=1
let g:pymode_virtualenv=0
let g:pymode_folding=0

let g:pymode_lint_ignore="W,E702,E501,E503,E303"
let g:pymode_rope_goto_def_newwin='vnew'

" pymode utils
let g:pymode_doc=0
let g:pymode_motion=1
"set foldmethod=marker
let g:pymode_indent=1
let g:pymode_utils_whitespaces=1
let g:pymode_folding=1
let g:pymode_syntax_all=1
"nnoremap <Leader>ch :PyLintAuto<CR>

" pymode rope
let g:pymode_rope=1
let g:pymode_rope_guess_project=1
let g:pymode_rope_vim_completion=0

let g:pymode_run_key="<Leader>r"
"}}}

" Plugin jedi-vim"{{{
let g:jedi#goto_assignments_command = "<Leader>g"
let g:jedi#documentation_command = "K"
let g:jedi#rename_command = "<Leader>f"
let g:jedi#completion_command = "<C-Space>"
let g:pymode_run_key = "<Leader>r"
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

vnoremap <silent> <Enter> :EasyAlign<cr>
nnoremap gm m


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
"
"neocomplcache keybinds  "{{{2
"let  g:loaded_youcompleteme = 1
"let g:loaded_neocomplete = 1

"au VimEnter *.py call neocomplete#init#disable()

function! Neo_enable() " {{{2
    "old for netcompletcache
    "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    "smap  <Tab>  <right><Plug>(neosnippet_expand_or_jump)
    "imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    "smap <C-k>     <Plug>(neosnippet_expand_or_jump)

    "inoremap <expr><C-e>     neocomplcache#complete_common_string()

    "inoremap <expr><C-g> neocomplcache#undo_completion()
    "inoremap <expr><C-l> neocomplcache#complete_common_string()
    "inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    "inoremap <expr><C-y>  neocomplcache#close_popup()
    "inoremap <expr><C-e>  neocomplcache#cancel_popup()
    "inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"

    "inoremap <expr><silent> <CR> My_cr_function()

    "function! My_cr_function()
        "return pumvisible() ? neocomplcache#close_popup() . "\<CR>": "\<CR>"
    "endfunction
    "
    "
    " new for neocomplete
    inoremap <buffer> <expr> <C-g> neocomplete#undo_completion()
    inoremap <buffer> <expr> <C-l> neocomplete#complete_common_string()
    inoremap <buffer> <silent> <CR>  <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return neocomplete#smart_close_popup() . "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <buffer> <expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <buffer> <expr> <C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <buffer> <expr> <BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <buffer> <expr> <C-y>  neocomplete#close_popup()
    inoremap <buffer> <expr> <C-e>  neocomplete#cancel_popup()


    smap <buffer> <Tab>  <right><Plug>(neosnippet_expand_or_jump)
    imap <buffer> <C-k>k     <Plug>(neosnippet_expand_or_jump)
    smap <buffer> <C-k>k     <Plug>(neosnippet_expand_or_jump)

    "let g:UltiSnipsExpandTrigger="<c-k>k"
    "let g:UltiSnipsJumpForwardTrigger="<c-k>k"
    "let g:UltiSnipsJumpBackwardTrigger="<c-j>j"
    if neocomplete#is_locked()
        NeoCompleteUnlock
    endif
    "NeocompleteEnable()
endfunction

function! Neo_disable() "{{{2
    "iunmap <buffer> <expr> <C-g>
    "iunmap <buffer> <expr> <C-l>
    "iunmap <buffer> <silent> <CR>
    """" <TAB>: completion.
    "iunmap <buffer> <expr> <TAB>
    """ <C-h>, <BS>: close popup and delete backword char.
    "iunmap <buffer> <expr> <C-h>
    "iunmap <buffer> <expr> <BS>
    "iunmap <buffer> <expr> <C-y>
    "iunmap <buffer> <expr> <C-e>
    "sunm <buffer> <Tab>
    "iunmap <buffer> <C-k>k
    "sunm <buffer> <C-k>k
    "NeoCompleteDisable
    NeoCompleteLock
endfunction 
    
"nmap <S-n> <C-o>:call Neo_enable()<CR>

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

au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
au BufEnter *.org  call org#SetOrgFileType()

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

        "g:vjde_doc_gui_height   height of the window
        "g:vjde_doc_gui_width   width of the window
        "g:vjde_doc_delay       once a item selected ,delay how long.

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
"au BufReadPost * if getline(1) =~ "mutt" | setf muttrc | endif

au FileType python setlocal list
au FileType python setlocal listchars=tab:ß⌂,trail:•,nbsp:◊,extends:►,precedes:◄ 
au FileType opencl setlocal commentstring=//%s
"au FileType python call neocomplete#init#disable() | call youcompleteme#Enable() 

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
autocmd FileType lisp set comments=:;,sr:;;,mb:;;,ex:;;
"autocmd FileType python :call Neo_disable()

"============================================================
"autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

"if has("autocmd") && exists("+omnifunc")
    "autocmd Filetype *
                "\Filetypeif &omnifunc == "" |
                "\Filetypeifsetlocal omnifunc=syntaxcomplete#Complete |
                "\Completeendif
"endif

autocmd Filetype java,c,cpp 
        \ inoremap ;; <end>;|
        \ imap ;] <end>;<ESC>]}a|
        \ nnoremap ;; <end>a;<ESC>

"autocmd FileType java,javascript,html,css imap  ; <C-R>=My_appendSemicolon(0,0)<CR>
"autocmd FileType java,javascript,html,css map  ; i;<esc>
"autocmd FileType java,javascript,html,css map  ;; i<C-R>=My_appendSemicolon(2,2)<CR><esc>
"autocmd FileType java,javascript,html,css imap  ;; <C-R>=My_appendSemicolon(2,0)<CR><esc>a
autocmd FileType markdown map <Leader>md <ESC>:MDP<CR>

"autocmd BufEnter * call DoWordComplete() 
"

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif 
"autocmd BufLeave * if pumvisible() == 0|pclose|endif

autocmd BufRead,BufNewFile *   if &ft != 'python'  | :call Neo_enable() | else | :call Neo_disable() |  endif 

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
"

cmap tn tabnew
cmap vte Vtabedit
cmap mru FufMruFile
ca w!! w !sudo tee "%" >/dev/null
ca W w !sudo tee % > /dev/null
"}}}
"
hi Normal ctermbg=none

"au BufReadPost *.py call neocomplete#init#disable()



