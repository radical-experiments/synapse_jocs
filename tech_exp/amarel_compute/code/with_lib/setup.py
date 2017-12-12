from distutils.core import setup, Extension

setup(name="compute_atoms", version="1.0",
      ext_modules=[Extension("compute_atoms", ["func_c.c"], 
      #library_dirs=["/scratch/mingtha/synapse_exp/repos/synapse_jocs/tech_exp/amarel_compute/with_lib"],
      library_dirs=["."],
      libraries=["ext"]
      )])
