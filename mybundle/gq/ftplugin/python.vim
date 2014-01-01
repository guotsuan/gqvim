" these are already are defaults "{{{
setlocal tabstop=8
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab  "}}}
"setlocal noexpandtab


setlocal colorcolumn=80
"setlocal  guifont=monofur\ 13
setlocal foldexpr=gqpyfolding#expr(v:lnum)
setlocal foldtext=gqpyfolding#text()

command! -buffer -nargs=0 GqAutopep8 :call pyformat#autopep8()
nnoremap <Leader>ch :GqAutopep8<CR>
setlocal rnu

python << EOF
import sys, vim, os

curpath = vim.eval("getcwd()")
libpath = os.path.join(vim.eval("expand('<sfile>:p:h:h')"), 'pylibs')

sys.path = [libpath, curpath]  + sys.path
EOF

