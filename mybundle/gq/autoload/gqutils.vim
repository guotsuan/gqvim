" Create a scratch buffer with a list of files (full path names).
" Argument is a specification like '*.c' to list *.c files (default is '*').
" Can use '*.[ch]' to find *.c and *.h (see :help wildcard).
" If command uses !, list includes matching files in all subdirectories.
" If filespec contains a slash or backslash, the path in filespec is used;
" otherwise, start searching in directory of current file.
function! gqutils#listfiles(bang, filespec)
  if a:filespec =~ '[/\\]'  " if contains path separator (slash or backslash)
    let dir = fnamemodify(a:filespec, ':p:h')
    let fnm = fnamemodify(a:filespec, ':p:t')
  else
    let dir = expand('%:p:h')  " directory of current file
    let fnm = a:filespec
  endif
  if empty(fnm)
    let fnm = '*'
  endif
  if !empty(a:bang)
    let fnm = '**/' . fnm
  endif
  let files = filter(split(globpath(dir, fnm), '\n'), '!isdirectory(v:val)')
  return files
  "echo 'dir=' dir ' fnm=' fnm ' len(files)=' len(files)
  "if empty(files)
    "echo 'No matching files'
    "return
  "endif
  "new
  
  "setlocal buftype=nofile bufhidden=hide noswapfile
  "call append(line('$'), files)
  "1d  " delete initial empty line
  " sort i  " sort, ignoring case
endfunction
"command! -bang -nargs=? Listfiles call gqutils#listfiles('<bang>', '<args>')


function! gqutils#selindent()
    let temp_var = indent(line('.'))

    while (indent(line('.') - 1) >= temp_var || strlen(getline(line('.')-1)) == 0 ) &&
          \ line('.') -1 != 0
        exe "norm k"
    endwhile
    exe "norm k"

    exe "norm V"
    while (indent(line('.') + 1) >= temp_var || strlen(getline(line('.')+1)) == 0 ) &&
          \ line('.')  +1!= line('$') 
        exe "norm j"
    endwhile

    if line('.') + 1 == line('$')
        exe "norm j"
    endif
endfunction

function! gqutils#addcomment(char, pos)
    let cs = &commentstring
    if a:char == "{" || a:char =="}"
        let char =' '
    else 
        let char = a:char
    endif

    if a:pos == 1
        let csf = cs.'{{{'.char
        let csf = substitute(csf, '%s', '  ', "")
    else
        let csf = cs.char.'}}}'
        let csf = substitute(csf, '%s', '  ', "")
    endif
    call setreg('k', csf)
    exe 'norm $a  '
    exe 'norm "kp'
endfunction
