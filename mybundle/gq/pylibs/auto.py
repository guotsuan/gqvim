import vim
from autopep8 import fix_file


class Gq_Options():
    aggressive = 0
    diff = False
    ignore = 'E24,W402'
    in_place = True
    max_line_length = 79
    pep8_passes = 100
    recursive = False
    select = 'E231,E226'
    verbose = 0


def gq_fix_file():
    fix_file(vim.current.buffer.name, Gq_Options)
