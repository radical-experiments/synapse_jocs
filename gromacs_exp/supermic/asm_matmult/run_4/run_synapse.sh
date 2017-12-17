#!/usr/bin/env bash

work_dir=$1
echo $work_dir

source /work/mha/synapse_exp/ve.synapse/bin/activate

ts=(1000 5000 10000 25000 50000 75000 100000)
flops=(588248864772 2927571098928 5856802123966 14668934409292 29397332557090 44120213286223 58880724789253)


for i in `seq 0 6`
do
    for iter in `seq 1 10`
    do
        echo $mat_size $iter
        echo $(pwd)
        perf stat radical-synapse-sample -f ${flops[$i]} -s 1 2>> $work_dir/perf_stat_synapse_${ts[$i]}
    done
done
