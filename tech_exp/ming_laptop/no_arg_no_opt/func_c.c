#include "func_c.h"

#include <time.h>


static char docstring[] = "This module provides functions for the different compute atom functions";


static void _simple_adder(long iter);
static void _mat_mult(long iter, volatile float *A, volatile float *B, volatile float *C, volatile long len);
//static void _mat_mult(long iter, volatile float *A, volatile float *B, volatile float *C, volatile long len)  __attribute__((optimize("-O0")));



static PyObject* 
atom_simple_adder(PyObject *self, PyObject *args)
{
    // args provide the number of flops to implement

    // The number of flops to emulate is an input argument to 'args'
    // The kernel called emulates a fixed number of cycles. We emulate
    //  the designated number of cycles to emulate by specifying the 
    //  number of times (iter) to run the loop

    long flops;
    long iter;

    if (!PyArg_ParseTuple(args, "l", &flops)) { return NULL; }

    iter = flops / ADDER_FLOPS_PER_ITER;
    _simple_adder(iter);

    Py_RETURN_NONE;
}

static PyObject*
atom_mat_mult(PyObject *self, PyObject *args)
{

    long flops;
    volatile long len;

    if (!PyArg_ParseTuple(args, "ll", &flops, &len)) { return NULL; }

    long iter = flops; // And some other stuff

    long size = len*len;
    //printf("size %d\n", len);
    volatile float *A = (float*) malloc(size * sizeof(float));
    volatile float *B = (float*) malloc(size * sizeof(float));
    volatile float *C = (float*) malloc(size * sizeof(float));

    _mat_mult(iter, A, B, C, len);

    free((void*) A);
    free((void*) B);
    free((void*) C);

    Py_RETURN_NONE;
}


static void _simple_adder(long iter)
{
    clock_t start, end;
    double cpu_time_used;

    start = clock();

    long i;
    for (i = 0; i < iter; i++)
    {
        {
        __asm__ __volatile__
            (
            "addl %%eax, %%eax \n\t"
            "addl %%ebx, %%ebx \n\t"
            "addl %%ecx, %%ecx \n\t"
            "addl %%edx, %%edx \n\t"
            : /* outputs */
            : /* inputs */
            : /* clobbered */ "eax", "ebx", "ecx", "edx"
            );
        }
    }

    end = clock();
    cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
    printf("time for _simple atom to execute: %f (s)\n", cpu_time_used);
}


static void _mat_mult(long iter, volatile float *A, volatile float *B, volatile float *C, volatile long len)
{

    //clock_t start, end;
    //double cpu_time_used;

    //start = clock();

    volatile long i, j, k;

    for (i = 0; i < len; i++)
    {
        for (j = 0; j < len; j++)
        {
            for (k = 0; k < len; k++)
            {
                //printf("%d %d %d\n", i, j, k);
                C[i*len + j] += (A[i*len + k] * B[k*len + j]);
            }
        }
    }

    //end = clock();
    //cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
    //printf("time for _mat_mult atom to execute: %f (s)\n", cpu_time_used);
}


PyMODINIT_FUNC
initcompute_atoms(void)
{
    Py_InitModule3("compute_atoms", module_methods, docstring);
}
