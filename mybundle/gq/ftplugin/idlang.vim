set commentstring=;%s
set suffixesadd=.pro

set number
set iskeyword+=^,
set isfname+=^,


let idl_dir='~/usr/include/idl'

let dir = fnamemodify(idl_dir, ':p:h')
let fnm = '**/'
let dirs = filter(split(globpath(dir, fnm), '\n'), 'isdirectory(v:val)')
let &path=&path.','.idl_dir
for dir in dirs
    let &path=&path.','.dir
endfor


"set path+=~/usr/include/idl
"set path+=~/usr/include/idl/gq
"set path+=~/usr/include/idl/astron/pro
"set path+=~/usr/include/idl/idlutils/pro
"set path+=~/usr/include/idl/idlutils/mpfit
"set path+=~/usr/include/idl/idlutils/red
"set path+=~/usr/include/idl/idlutils/textoidl
"set path+=~/usr/include/idl/idlutils/kcorrect/pro


set tags=~/tags,~/usr/include/idl/tags,~/.vimtags


