#!/usr/bin/env bash

for mat_size in 1000 2500 5000 7500 10000
do
    for iter in 1 2 3 4 5
    do
        echo $mat_size $iter
        perf stat python mult_array.py $mat_size 2>> perf_stat_with_lib_$mat_size
    done
done
