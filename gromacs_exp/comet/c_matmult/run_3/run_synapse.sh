#!/usr/bin/env bash

source /home/mingtha/synapse_exp/ve.synapse/bin/activate

for sample in 8 43 87 217 437 655 874
do
    for iter in `seq 1 10`
    do
        echo $mat_size $iter
        perf stat radical-synapse-sample -cat matmult -f 111 -s $sample 2>> perf_stat_synapse_$sample
    done
done
