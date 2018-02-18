"  {{{  Basic
"  
set nocompatible

" NeoBudle Settings {{{1 "

set runtimepath+=$HOME/.vim/ne/neobundle.vim/


call neobundle#begin(expand('$HOME/.vim/ne'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'linux' : 'make',
            \     'unix' : 'gmake',
            \    },
            \ }

"NeoBundle 'Valloric/YouCompleteMe', {
        "\ 'build' :  {
        "\   'linux' : './install.py --clang-completer --system-libclang',
        "\   'mac' : './install.py --clang-completer',
        "\      },
        "\ }


NeoBundle 'tpope/vim-obsession'
NeoBundle 'aperezdc/vim-template'
NeoBundle 'bruno-/vim-husk'
NeoBundle 'vimwiki/vimwiki', {'rev' : 'dev'}
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'benmills/vimux'    
NeoBundle 'Shougo/neco-syntax'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'shime/vim-livedown'

if has('nvim')
    NeoBundle 'Shougo/deoplete.nvim'
endif



call neobundle#end() 

" 1}}} NeoBudle Settings "


filetype off

NeoBundleCheck

" }}}

" {{{ vundle plugin 

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

"set autochdir
set iskeyword+=_,$,@,%,#  " none of these are word dividers

" turn off the dict, it is too slow
" set dict+=/usr/share/dict/british

"  }}}

" {{{ Plugin Lists

Plugin 'kshenoy/vim-signature'
Plugin 'tpope/vim-dispatch'
Plugin 'gmarik/vundle'
Plugin 'tomasr/molokai'
"Plugin 'Indent-Guides'
Plugin 'TeX-9'
Plugin 'earendel'
Plugin 'L9'
Plugin 'delimitMate.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'FuzzyFinder'
Plugin 'tpope/vim-surround'
Plugin 'CmdlineComplete'

Plugin 'Lokaltog/vim-easymotion'
Plugin 'hsitz/VimOrganizer'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'matchit.zip'
Plugin 'rking/ag.vim'

"Plugin 'fisadev/fisa-vim-colorscheme'
"
Plugin 'fisadev/FixedTaskList.vim'
Plugin 'kien/tabman.vim'
Plugin 'mtth/locate.vim'
Plugin 'klen/python-mode'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'xolox/vim-notes'
Plugin 'Conque-Shell'
Plugin 'Decho'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-reload'
Plugin 'xolox/vim-shell'

Plugin 'terryma/vim-multiple-cursors'
Plugin 'mileszs/ack.vim'
Plugin 'SirVer/ultisnips'
Plugin 'guotsuan/my-custom.vim'


" managed by NeoBudle
"Plugin 'Shougo/vimproc'
Plugin 'Valloric/YouCompleteMe'
"
if has("lua") 
    Plugin 'Shougo/neocomplete.vim'
endif
"Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neco-vim'
Plugin 'Shougo/unite.vim'

Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'Shougo/vimshell'
Plugin 'VOoM'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-scriptease'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'svermeulen/vim-easyclip'
Plugin 'davidhalter/jedi-vim'
Plugin 'now/vim-quit-if-only-quickfix-buffer-left'

"Plugin 'vim-scripts/Wombat'
Plugin 'bash-support.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'mbbill/undotree'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"Plugin 'mkitt/markdown-preview.vim'
"Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'petRUShka/vim-opencl'
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'Zenburn'

"disabled
"Plugin 'Vim-JDE'
Plugin 'Lokaltog/powerline'
"Plugin 'Shougo/neocomplcache'
"Plugin 'Yggdroot/indentLine'
Plugin 'honza/vim-snippets' 
Plugin 'Shougo/neosnippet-snippets'

"cause duplicate
"Plugin 'scrooloose/syntastic'
"Plugin 'vimwiki/vimwiki'
Plugin 'FelikZ/ctrlp-py-matcher'

call vundle#end()

""}}}

"  {{{ General
"
let g:powerline_loaded = 1  "prefered the vim-airline

"set regexpengine=1
let g:loaded_airline = 0
set ignorecase
filetype plugin indent on
syntax on
set clipboard=unnamed   "share clipboard with system"
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

"copy
vmap <F7> "+ygv"zy`>
"paste (Shift-F7 to paste after normal cursor, Ctrl-F7 to paste over visual selection)
nmap <F7> "zgP
nmap <S-F7> "zgp
imap <F7> <C-r><C-o>z
vmap <C-F7> "zp`]
cmap <F7> <C-r><C-o>z
"copy register

autocmd FocusGained * let @z=@+


"
" }}}

" {{{ I18n
set fileencodings=utf-8,prc,taiwan,enc-cn,enc-tw,gbk,gb2312,big5,ansi
set fileencoding=utf-8
set encoding=utf-8
"set termencoding=utf-8
set fileformats=unix,dos

" }}}

" {{{  UI

"colorscheme zenburn

"if &term =~? 'xterm\|urxvt\|screen-256\|screen'
    ""colorscheme fisa
    ""colorscheme molokai
    ""colorscheme delek
    ""colorscheme wombat256
    ""set background=dark
    ""colorscheme earendel
"else
    ""colorscheme delek
    "colorscheme zenburn
    "colorscheme peaksea
"endif
let &t_Co=256
colorscheme zenburn
"colorscheme molokai
"
let os=substitute(system('uname'), '\n', '', '')


if has("gui_running")
    set lines=300 columns=140
    "colorscheme wombat
    "colorscheme molokai
    colorscheme earendel
    set background=dark
    set cursorcolumn 
    set cursorline 
    "set lines=60 
    "set columns=110
    set guioptions=agimt
    "set guifont=Monaco\ 11
    "set guifontwide=Microsoft\ Yahei\ 9
    if os == 'Darwin' || os == 'Mac'
        ""set guifont=Consolas\ 12
        "set guifont=Monaco\ for\ Powerline\ 11
        "set guifont=Mensch\ for\ Powerline:h12
        set guifont=Inconsolata\ for\ Powerline\ 13
        "set guifont=Mensch\ 11
        "set guifont=Mensch\ for\ Powerline\ 11
        "set guifont=CPMono_v07\ Light\ 12
        "set guifont=Monaco\ 11
        "set guifont=Monaco\ 11
        set guifontwide=Microsoft\ Yahei\ 10
    else
        set guifont=Menlo\ Regular:h14
    endif

endif

set laststatus=2
"set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
set showtabline=2  " 0, 1 or 2; when to use a tab pages line
set tabline=%!MyTabLine()  " custom tab pages line
set guitablabel=%{GuiTabLabel()}
"set incsearch
"set nolz " do now redraw while runing macros
set nolist " wo do what o show tabs, to ensure we get them out of my files

"set listchars=tab:ß⌂,trail:•,nbsp:◊,extends:►,precedes:◄ " show tabs and trailing
"set listchars=trail:•,nbsp:◊,extends:►,precedes:◄

set matchtime=5 " how many tenths of a second to blink 
set nostartofline " leave my cursor where it was
set ruler 
set showcmd
set showmatch 
hi MatchParen ctermbg=blue guibg=lightblue
hi MatchParen ctermfg=yellow guifg=yellow
hi ColorColumn term=underline ctermfg=blue ctermbg=yellow guifg=blue guibg=yellow

function! MyTabLine() " {{{2
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

"
" }}}

" {{{ Folding
set foldenable
set foldcolumn=4
set foldmethod=marker
set foldopen+=jump,insert

function! SimpleFoldText() " {
    return getline(v:foldstart).' '
endfunction " }

"set foldmarker={{{,}}}
"set foldlevel=1000
"set foldtext=SimpleFoldText()
"set foldclose=all

" }}}

"  Plugins Settings   "  {{{ 
"

if has("nvim")
    let g:python3_host_prog = '/usr/bin/python'
    let g:deoplete#enable_at_startup = 1
    if !exists("g:deoplete#omni_patterns")
        let g:deoplete#omni_patterns = {}
    endif
    let g:deoplete#omni_patterns.python = '[^. \t]\.\w*'

endif

let g:vim_markdown_folding_disabled = 1

" vim-template {{{ "
let g:templates_directory = ['$HOME/.vim/mybundle/templates']
" }}} vim-template "

"bash-support {{{2
let g:BASH_InsertFileHeader='no'
"2}}}

" vim-notes {{{2
let g:notes_directories = ['~/Dropbox/notes']
"2}}}

" vim-signatur {{{
    let g:SignatureMap = {
      \ 'Leader'             :  "gm",
      \ 'PlaceNextMark'      :  ",",
      \ 'ToggleMarkAtLine'   :  ".",
      \ 'PurgeMarksAtLine'   :  "-",
      \ 'PurgeMarks'         :  "<Space>",
      \ 'PurgeMarkers'       :  "<BS>",
      \ 'GotoNextLineAlpha'  :  "']",
      \ 'GotoPrevLineAlpha'  :  "'[",
      \ 'GotoNextSpotAlpha'  :  "`]",
      \ 'GotoPrevSpotAlpha'  :  "`[",
      \ 'GotoNextLineByPos'  :  "]'",
      \ 'GotoPrevLineByPos'  :  "['",
      \ 'GotoNextSpotByPos'  :  "]`",
      \ 'GotoPrevSpotByPos'  :  "[`",
      \ 'GotoNextMarker'     :  "]-",
      \ 'GotoPrevMarker'     :  "[-",
      \ 'GotoNextMarkerAny'  :  "]=",
      \ 'GotoPrevMarkerAny'  :  "[=",
      \ 'ListLocalMarks'     :  "'?",
      \ }
"}}}

"Tabular ;{{{2
let mapleader=','
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
 
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

"2}}}

" Locate   "  {{{2
let g:locate_initial_mark = 'c'
let g:locate_smart_case = 1
let g:locate_mappings = 1
"  2}}}

"vim airline {{{
"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_detect_modified=1
let g:airline_detect_iminsert=1
let g:airline_theme='bubblegum'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
"let g:airline_left_sep = ''
"let g:airline_right_sep = '«'
"let g:airline_linecolumn_prefix = '␤ '
if os == 'Darmin' || os == 'Mac'
    "let g:airline_symbols.linenr = '¶'
    "let g:airline_symbols.branch = '⎇ '
    ""let g:airline_paste_symbol = 'ρ'
    "let g:airline_symbols.paste = 'Þ'
    "let g:airline_symbols.whitespace = 'Ξ'
    let g:airline_powerline_fonts=0
else
    "let g:airline_symbols.linenr = '¶'
    "let g:airline_symbols.branch = '⎇ '
    ""let g:airline_paste_symbol = 'ρ'
    "let g:airline_symbols.paste = 'Þ'
    "let g:airline_symbols.whitespace = 'Ξ'
    let g:airline_powerline_fonts=0
endif

let g:airline_detect_iminsert = 1
let g:airline#extensions#tabline#enabled = 1

"}}}
"
"YCM plugin    "{{{
"let g:ycm_add_preview_to_completeopt=1
let g:ycm_filetype_whitelist={'python': 1, 'go':1, 'cpp': 1, 'c':1}
"let g:loaded_youcompleteme=0
nnoremap <leader>jd :YcmCompleter GoTo<CR>'
"}}}

"Ultisnips  "{{{


"imap <expr> <C-k>   neosnippet#expandable_or_jumpable()? 
 "\ "\<Plug>(neosnippet_expand_or_jump)"
 "\: "\<C-R>=UltiSnips#ExpandSnippetOrJump()<cr>"

"smap <expr> <C-k>   neosnippet#expandable_or_jumpable()? 
 "\ "\<Plug>(neosnippet_expand_or_jump)"
 "\: "<Esc>:call UltiSnips#ExpandSnippet()<cr>"

let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
let g:UltiSnipsEnableSnipMate=1

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

"easyclip"{{{
imap <c-v> <plug>EasyClipInsertModePaste
let g:EasyClipAutoFormat=0
let g:EasyClipUsePasteToggleDefaults = 0
let g:EasyClipShareYanks = 0

nmap <Leader>ff <plug>EasyClipSwapPasteForward
nmap <Leader>dd <plug>EasyClipSwapPasteBackwards


"}}}
"
"{{{ "vim gitgutter
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0
"}}}
"
" vim-latex     "  {{{2
"set grepprg=grep\ -nH\ $*
"let g:tex_flavor = "pdflatex"     
"let g:tex_synctex=1
"let g:tex_fold_enabled = 1
"let g:tex_viewer = {'app': 'evince', 'target': 'pdf'}

" 2}}}

" tex nine   " {{{2
"
let g:tex_flavor = "latex"     
let g:tex_nine_config = {
     \ 'compiler': 'pdflatex',
      \  'viewer': {'app':'evince', 'target':'pdf'},
      \ 'verbose': 1,
      \ 'synctex': 0
     \}
"2}}}
if has("gui_running")
    let g:tex_nine_config.synctex = 1
endif





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

"   neocomplete {{{2
" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
" Use neocomplete

"let g:loaded_neocomplete = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_debug =0

if !exists('g:neocomplete#sources')
  let g:neocomplete#sources = {}
endif

let g:neocomplete#sources.lua = ['_']

" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
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
let g:neocomplete#force_omni_input_patterns.tex = '\\ref{\|\\cite{\|\\citep{'

if !exists('g:neocomplete#sources')
    let g:neocomplete#sources = {}
endif


" Key bindings for neocomplcache


" 2}}}

"lua ftplugin.vim  "  {{{2
let g:lua_define_completefunc = 1
let g:lua_complete_omni=0
let g:lua_complete_dynamic=0
let g:lua_check_globas = 1
let g:lua_complete_globals = 1
let g:lua_complete_library = 1
let g:lua_define_omnifunc = 1
"let g:lua_check_synatx=
"  2}}} 
"
" Python mode {{{2
"
" python codes check
let g:pymode_lint=1
let g:pymode_lint_checker="pyflakes,pep8,mccabe"
let g:pymode_lint_write=0
let g:pymode_lint_onfly=0
let g:pymode_lint_hold=1
let g:pymode_lint_signs=1
let g:pymode_virtualenv=0
let g:pymode_folding=0

let g:pymode_lint_ignore="W,E702,E501,E503,E303,E265,E302,E2,E1"
let g:pymode_rope_goto_def_newwin='vnew'

" pymode utils
let g:pymode_doc=0
let g:pymode_motion=1
"set foldmethod=marker
let g:pymode_indent=1
let g:pymode_utils_whitespaces=1
let g:pymode_folding=0
let g:pymode_syntax_all=1
"nnoremap <Leader>ch :PyLintAuto<CR>

" pymode rope
let g:pymode_rope=0
let g:pymode_rope_guess_project=1
let g:pymode_rope_vim_completion=0

let g:pymode_run_key="<Leader>r"
"2}}}

" Plugin jedi-vim"{{{2
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

"2 }}}

"}}}

"Key Bindings  " {{{

" for paste  {{{2
map <F9> :set paste<CR>
map <F10> :set nopaste<CR>
imap <F9> <C-O>:set paste<CR>
imap <F9> <nop>
set pastetoggle=<F9>

" 2}}}

vnoremap <silent> <Enter> :EasyAlign<cr>
"nnoremap gm m


"too slow
"map <F3> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
nmap <F3> <ESC>:w<cr>:!make<cr>
nmap <F6> :cn<cr>
nmap <F5> :lmake<cr>
nmap <F8> :set list!<cr>
"nmap <F2> :UpdateTags<cr>
nnoremap <silent> <F4> :TagbarToggle<CR>

nmap <leader>u :UndotreeToggle<CR>
nmap <leader>t :TagbarToggle<CR>


"inoremap <Leader><Space>  <Esc>i<Space><Esc>la<Space>
"nnoremap <Leader><Space>  <Esc>i<Space><Esc>la<Space><Esc>
"nnoremap <Leader><Space>+  <Esc>i<Space><Esc>la<Space><Esc>
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
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"



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
    "inoremap <buffer> <silent> <CR>  <C-r>=<SID>my_cr_function()<CR>
    inoremap <buffer> <expr> <C-g> neocomplete#undo_completion()
    inoremap <buffer> <expr> <C-l> neocomplete#complete_common_string()

    function! s:my_cr_function()
      return neocomplete#smart_close_popup() . "\<CR>"
      "return oldmap . neocomplete#smart_close_popup() . "\<CR>"
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
    if !neocomplete#is_enabled() 
        call neocomplete#init#enable()
    endif
    "if neocomplete#is_locked()
        "NeoCompleteUnlock
    "endif
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
    if neocomplete#is_enabled()
        NeoCompleteDisable
    endif
    "NeoCompleteLock
endfunction 
    
nnoremap <silent> <leader>gd    :GitGutterToggle<CR>

"2}}}

" fuzzyfinder keybinds"{{{2
let g:fuf_modesDisable = []
let g:fuf_mrufile_maxItem = 400
let g:fuf_mrucmd_maxItem = 400
nnoremap <silent> <leader>sj     :FufBuffer<CR>
nnoremap <silent> <leader>sk     :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> <leader>sK     :FufFileWithFullCwd<CR>
nnoremap <silent> <leader>s<C-k> :FufFile<CR>
nnoremap <silent> <leader>sl     :FufCoverageFileChange<CR>
nnoremap <silent> <leader>sL     :FufCoverageFileChange<CR>
nnoremap <silent> <leader>s<C-l> :FufCoverageFileRegister<CR>
nnoremap <silent> <leader>sd     :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> <leader>sD     :FufDirWithFullCwd<CR>
nnoremap <silent> <leader>s<C-d> :FufDir<CR>
nnoremap <silent> <leader>sn     :FufMruFile<CR>
nnoremap <silent> <leader>sN     :FufMruFileInCwd<CR>
nnoremap <silent> <leader>sm     :FufMruCmd<CR>
nnoremap <silent> <leader>su     :FufBookmarkFile<CR>
nnoremap <silent> <leader>s<C-u> :FufBookmarkFileAdd<CR>
vnoremap <silent> <leader>s<C-u> :FufBookmarkFileAddAsSelectedText<CR>
nnoremap <silent> <leader>si     :FufBookmarkDir<CR>
nnoremap <silent> <leader>s<C-i> :FufBookmarkDirAdd<CR>
nnoremap <silent> <leader>st     :FufTag<CR>
nnoremap <silent> <leader>sT     :FufTag!<CR>
nnoremap <silent> <leader>s<C-]> :FufTagWithCursorWord!<CR>
nnoremap <silent> <leader>s,     :FufBufferTag<CR>
nnoremap <silent> <leader>s<     :FufBufferTag!<CR>
vnoremap <silent> <leader>s,     :FufBufferTagWithSelectedText!<CR>
vnoremap <silent> <leader>s<     :FufBufferTagWithSelectedText<CR>
nnoremap <silent> <leader>s}     :FufBufferTagWithCursorWord!<CR>
nnoremap <silent> <leader>s.     :FufBufferTagAll<CR>
nnoremap <silent> <leader>s>     :FufBufferTagAll!<CR>
vnoremap <silent> <leader>s.     :FufBufferTagAllWithSelectedText!<CR>
vnoremap <silent> <leader>s>     :FufBufferTagAllWithSelectedText<CR>
nnoremap <silent> <leader>s]     :FufBufferTagAllWithCursorWord!<CR>
nnoremap <silent> <leader>sg     :FufTaggedFile<CR>
nnoremap <silent> <leader>sG     :FufTaggedFile!<CR>
nnoremap <silent> <leader>so     :FufJumpList<CR>
nnoremap <silent> <leader>sp     :FufChangeList<CR>
nnoremap <silent> <leader>sq     :FufQuickfix<CR>
nnoremap <silent> <leader>sy     :FufLine<CR>
nnoremap <silent> <leader>sh     :FufHelp<CR>
nnoremap <silent> <leader>se     :FufEditDataFile<CR>
nnoremap <silent> <leader>sr     :FufRenewCache<CR>
  "2}}}

"indent Guide setting {{{2
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=lightgrey ctermbg=4
"2}}}

" ctrlp plugin keymap "{{{2
"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_match_func = {'match': 'pymatcher#PyMatch'}

"2}}}

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
 let g:neocompele_include_patterns={'java':'^\s*import'}
 
"
"au BufReadPost * if getline(1) =~ "mutt" | setf muttrc | endif

au FileType python setlocal list
au FileType python setlocal listchars=tab:ß⌂,trail:•,nbsp:◊,extends:►,precedes:◄ 
au FileType opencl setlocal commentstring=//%s
"au FileType python call neocomplete#init#disable() | call youcompleteme#Enable() 

"omin completion
"==========================================================
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType xml setlocal omnifunc=xmlcomplete#completeTags
autocmd FileType lua setlocal omnifunc=xolox#lua#completefunc
"autocmd FileType lua setlocal com=xolox#lua#completefunc
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
autocmd FileType markdown map <Leader>md <ESC>:LivedownPreview<CR>
autocmd Filetype cfg set commentstring=#%s
autocmd FileType python set comments=b:#


"autocmd BufEnter * call DoWordComplete() 
"

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif 
"autocmd BufLeave * if pumvisible() == 0|pclose|endif

"autocmd FileType python,go,c,cpp NeoBundleSource 'Valloric/YouCompleteMe'


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
"cmap U Unite
cmap vte Vtabedit
cmap mru FufMruFile
ca w!! w !sudo tee "%" >/dev/null
ca W w !sudo tee % > /dev/null
"}}}
"
"hi Normal ctermbg=none

"au BufReadPost *.py call neocomplete#init#disable()

autocmd BufWritePre,FileWritePre *   ks|call LastMod()|'s
fun! LastMod()
  if line("$") > 20
    let l = 20
  else
    let l = line("$")
  endif
  exe "1," . l . "g/Last modified: /s/Last modified: .*/Last modified: " .
  \ strftime("%Y %b %d")
endfun

au BufRead /tmp/mutt-* set tw=72


