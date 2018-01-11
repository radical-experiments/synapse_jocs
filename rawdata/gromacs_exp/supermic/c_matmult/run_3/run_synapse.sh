#!/usr/bin/env bash

work_dir=$1
echo $work_dir

source /work/mha/synapse_exp/ve.synapse/bin/activate

for samples in 8 41 83 208 416 625 833
do
    for iter in `seq 1 10`
    do
        echo $mat_size $iter
        echo $(pwd)
        perf stat radical-synapse-sample -cat matmult -f 17660856028 -s $samples 2>> $work_dir/perf_stat_synapse_$samples
    done
done
