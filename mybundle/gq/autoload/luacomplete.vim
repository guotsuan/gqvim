if !has('lua')
    echo "Error: Required vim compiled with +lua"
    finish
endif


function! luacomplete#Complete(findstart, base)
   " find start=1 when we need to get the text length
    if a:findstart == 1
        let line = getline('.')
        let idx = col('.')
        while idx > 0
            let idx -= 1
            let c = line[idx]
            if c =~ '\w'
                continue
            elseif ! c =~ '\.'
                let idx = -1
                break
            else
                break
            endif
        endwhile
        "Decho "return idx",idx
        return idx
    else
        let line = getline('.')
        let idx = col('.')
        let cword = ''
        while idx > 0
            let idx -= 1
            let c = line[idx]
            if c =~ '\w' || c =~ '\.'
                let cword = c . cword
                continue
            elseif strlen(cword) > 0 || idx == 0
                break
            endif
        endwhile
        "Decho "new second time", cword,a:base
        let res=[{'word':'lfs.dog'},{'word':'pig'}]
        "Decho "new second time",res
        return res


endfunction


