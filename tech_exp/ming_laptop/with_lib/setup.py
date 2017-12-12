from distutils.core import setup, Extension

setup(name="compute_atoms", version="1.0",
      ext_modules=[Extension("compute_atoms", ["func_c.c"], 
      #extra_objects=["compute_kernels.o"],
      library_dirs=["/home/mingtaiha/repos_test/python-c-api/with_lib"],
      libraries=["ext"],
      extra_compile_args=["-O0"]
      )])
      #ext_modules=[Extension("compute_atoms", ["func_c.c"])])
