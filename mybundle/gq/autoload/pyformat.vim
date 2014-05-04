
function! s:isinstring(linestr, idx) "{{{

    let par_list =['''', "\""]
    for item in par_list
        let i = a:idx
        let l_cnt =0 
        while i >= 0
            if a:linestr[i] == '''' || a:linestr[i] == "\""
               let l_cnt += 1
            endif
            let i=i-1
        endwhile
    endfor

    let len=strlen(a:linestr)
    for item in par_list
        let r_cnt=0
        for item in par_list
            let i = a:idx
            let r_cnt =0 
            while i <= len
                if a:linestr[i] == '''' || a:linestr[i] == "\""
                    let r_cnt += 1
                endif
                let i=i+1
            endwhile
        endfor
    endfor

    if l_cnt % 2 !=0 || r_cnt % 2 !=0
        return 1
    else
        return 0
    endif

endfunction "}}}

function! s:isoptional(linestr, idx) "{{{
    let par_list =[['(',')']]
    for [litem, ritem] in par_list
        let i = a:idx
        let l_cnt =0 
        while i >= 0
            if a:linestr[i] == litem
               let l_cnt += 1
            endif
            if a:linestr[i] == ritem
                let l_cnt -= 1
            endif
            let i=i-1
        endwhile
    endfor

    let len=strlen(a:linestr)
    for [litem, ritem] in par_list
        let r_cnt=0
        for [litem, ritem] in par_list
            let i = a:idx
            let cnt = 0
            let r_cnt =0 
            while i <= len
                if a:linestr[i] == litem
                    let r_cnt += 1
                endif
                if a:linestr[i] == ritem
                    let r_cnt -= 1
                endif
                let i=i+1
            endwhile
        endfor
    endfor


    if l_cnt > r_cnt 
        return 1
    else
        return 0
    endif

endfunction "}}}

function! pyformat#adjustspace() "{{{

    let org_x=col('.')
    let org_y=line('.')

    " move cursor to the begin of the line
    let x=cursor(org_y, 1)

    let op_list =[')','(', '{', '}'] " {{{

    let ft = &filetype

    for r in op_list
        let mitem='\s*'.r.'\s*'
        let ritem=r
        exe ':.s/'.mitem.'/'.ritem.'/ge'
    endfor " }}}

    let op_list =[',', ';', ':'] " {{{

    let ft = &filetype
    if ft == 'vim'
        let op_list =[',', ';' ] 
    endif


    for r in op_list
        let mitem='\s*'.r.'\s*'
        let ritem=r.' '
        exe ':.s/'.mitem.'/'.ritem.'/ge'
    endfor " }}}

    let op_list =['*', '+', '-', '/', '=', '>', '<'] " {{{

    for r in op_list
        if r == '*' || r== '/'
            let mitem='\s*\'.r.'\s*'
        else
            let mitem='\s*'.r.'\s*'
        endif
        if r == '/'
            let ritem=' \'.r.' '
        else
            let ritem=' '.r.' '
        endif
        exe ':.s/'.mitem.'/'.ritem.'/ge'
    endfor "}}}

    let op_list =['**', '==', '+=', '-=', '*=', '/=', '>=', '<='] " {{{

    for r in op_list
        let sc_list=split(r, '\zs') 
        if r == '**'
            let mitem='\s*\'.sc_list[0].'\s*\'.sc_list[1].'\s*'
        elseif r == '/=' || r == '*='
            let mitem='\s*\'.sc_list[0].'\s*'.sc_list[1].'\s*'
        elseif r == '**=' 
            let mitem='\s*\'.sc_list[0].'\s*'.sc_list[1].'\s*'.sc_list[2].'\s*'
        else
            let mitem='\s*'.sc_list[0].'\s*'.sc_list[1].'\s*'
        endif
        
        if r == '/='
            let ritem=' \'.r.' '
        else
            let ritem=' '.r.' '
        endif
        exe ':.s/'.mitem.'/'.ritem.'/ge'
    endfor "}}}

    let op_list =['**='] "{{{
    for r in op_list
        let sc_list=split(r, '\zs') 
        let mitem='\s*\'.sc_list[0].'\s*\'.sc_list[1].'\s*'.sc_list[2].'\s*'
        let ritem=' '.r.' '

        exe ':.s/'.mitem.'/'.ritem.'/ge'
    endfor "}}}

    let op = '='
    let linestr=getline('.')
    let start = 0
    let idx = 1
    let len=strlen(linestr)
    while idx >=0 && start <= len
        let idx = match(linestr,op,start)
        if idx >= 0 
            if s:isoptional(linestr, idx)
                call cursor(org_y, idx+1)
                exe  'norm hx'
                exe  'norm lx'
                let start=col('.')-1
            else
                call cursor(org_y, idx+1)
                let start=col('.')
            endif
            let linestr=getline('.')
            let len=strlen(linestr)
        endif
    endwhile
                
    exe ':s/\s*$//g'
    call cursor(org_y, org_x)
endfunction  "}}}

function! pyformat#deletespace() "{{{
    let linestr=getline('.')
    let col_idx=col('.')
endfunction "}}}

function! s:trimspace(item, pos)
    if a:pos
        return ':s/\s\+'.a:item.'/ '.a:item.'/g'
    else
        exe ':s/'.a:item.'\s\+/'.a:item.' /g'
    endif
endfunction


fun! pyformat#autopep8() "{{{
    if &modifiable && &modified
        try
            noautocmd write
        catch /E212/
            echohl Error | echo "File modified and I can't save it. Cancel operation." | echohl None
            return 0
        endtry
    endif
    "py from pymode import auto
    py import auto
    py auto.gq_fix_file()
    "py auto.fix_current_file()
    cclose
    edit
    call pymode#wide_message("AutoPep8 done.")
endfunction "}}}


fun! pyformat#adjustline() "{{{
    py import auto
    py line_in = vim.current.line
    py vim.current.line = auto.gq_fix_line(line_in)
endfunction  "}}}


