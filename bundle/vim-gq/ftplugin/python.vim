" these are already are defaults "{{{
"setlocal tabstop=4
"setlocal softtabstop=4
"setlocal shiftwidth=4
"setlocal textwidth=80
"setlocal smarttab
"setlocal expandtab  "}}}

set guifont=monofur\ 13

" python codes check
let g:pymode_lint = 1
"let g:pymode_lint_checker = "pylint,pyflakes,pep8,mccabe"
"let g:pymode_lint_checker = "pyflakes"
let g:pymode_lint_checker = "pylint,pep8"
let g:pymode_lint_write = 0
let g:pymode_lint_onfly = 1
let g:pymode_lint_hold = 0
let g:pymode_lint_signs = 1

"let g:pymode_lint_ignore="E2,W,E702,E501,E503,E303"

" pymode utils
let g:pymode_utils = 1
let g:pymode_doc=1
let g:pymode_motion=1
set foldmethod=marker
let g:pymode_indent = 1
let g:pymode_utils_whitespaces = 1
let g:pymode_folding=1
nnoremap <Leader>ch :PyLintAuto<CR>

" pymode rope
let g:pymode_rope = 0
let g:pymode_rope_guess_project=0
let g:pymode_rope_vim_completion=0

