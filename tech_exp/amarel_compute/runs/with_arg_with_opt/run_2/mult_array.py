import sys
from ctypes import *
from random import randint

from compute_atoms import *

_ARR_LEN = int(sys.argv[1])

atom_mat_mult(1, _ARR_LEN)
