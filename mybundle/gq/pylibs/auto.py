import vim
from autopep8 import fix_file, fix_code


# select='E231,E226'
# ignore='E24,W402'



class Gq_Options():
    aggressive = 2
    diff = False
    in_place = True
    max_line_length = 79
    pep8_passes = 100
    recursive = False
    select = ''
    ignore = ''
    line_range = ''
    indent_size = 4
    experimental=0
    verbose = 0


def gq_fix_file():
    fix_file(vim.current.buffer.name, Gq_Options)


def gq_fix_line(string):
    return fix_code(string, Gq_Options)
