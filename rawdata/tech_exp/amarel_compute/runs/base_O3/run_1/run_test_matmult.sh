#!/usr/bin/env bash

for mat_size in 1000 2500 5000 7500 10000
do
    for iter in `seq 1 10`
    do
        echo $mat_size $iter
        perf stat ./test_matmult_o3.o $mat_size 2>> perf_stat_o3_$mat_size
    done
done
