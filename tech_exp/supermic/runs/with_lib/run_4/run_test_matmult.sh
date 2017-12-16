#!/usr/bin/env bash

work_dir=$1
echo $work_dir

for mat_size in 1000 2500 5000 7500 10000
do
    for iter in `seq 1 10`
    do
        echo $mat_size $iter
        echo $(pwd)
        perf stat python $work_dir/mult_array.py $mat_size 2>> $work_dir/perf_stat_with_lib_$mat_size
    done
done
