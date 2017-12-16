#include <stdio.h>
#include <stdlib.h>


void _mat_mult(long iter, float *A, float *B, float *C, long len)
{
    long i, j, k;

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
}

int main(int argc, char** argv)
{

    long LEN = atol(argv[1]);
    long SIZE = LEN*LEN;

    float *A = (float*) malloc(SIZE * sizeof(float));
    float *B = (float*) malloc(SIZE * sizeof(float));
    float *C = (float*) malloc(SIZE * sizeof(float));

    _mat_mult(1, A, B, C, LEN);

    free((void*) A);
    free((void*) B);
    free((void*) C);

    return 0;
}
