#!/usr/bin/env bash

for mat_size in 1000 2500 5000 7500 10000
do
    for iter in `seq 1 10`
    do
        echo $mat_size $iter
        perf stat python mult_array.py $mat_size 2>> perf_stat_with_arg_with_opt_$mat_size
    done
done
