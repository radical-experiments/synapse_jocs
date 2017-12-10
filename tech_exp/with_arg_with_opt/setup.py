from distutils.core import setup, Extension

setup(name="compute_atoms", version="1.0",
      ext_modules=[Extension("compute_atoms", ["func_c.c"], extra_compile_args=["-g", "-O0"])])
      #ext_modules=[Extension("compute_atoms", ["func_c.c"])])
