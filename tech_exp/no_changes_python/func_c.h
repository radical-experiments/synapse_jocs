#ifndef FUNC_C_H
#define FUNC_C_H

#include <Python.h>
#include "unistd.h"

#define ADDER_FLOPS_PER_ITER 8


// Declaring function prototypes of available compute atom emulation methods
static PyObject* atom_simple_adder  (PyObject *self, PyObject *args);
static PyObject* atom_mat_mult      (PyObject *self, PyObject *args);
//static PyObject* atom_mat_mult      (PyObject *self, PyObject *args) __attribute((optimize("-O0")));

// Declaring the functions in the module
static PyMethodDef module_methods[] = {
    {"atom_simple_adder",   atom_simple_adder, METH_VARARGS, NULL},
    {"atom_mat_mult",       atom_mat_mult, METH_VARARGS, NULL},
    {NULL, NULL, 0, NULL}
};

#endif
