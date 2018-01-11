#!/usr/bin/env bash

source /home/mingtha/synapse_exp/ve.synapse/bin/activate

ts=(1000 5000 10000 25000 50000 75000 100000)
flops=(555194201392 2760532019871 5528605192120 13820039254115 27765733894009 41636750453865 55585254490492)


for i in `seq 0 6`
do
    for iter in `seq 1 10`
    do
        perf stat radical-synapse-sample -f ${flops[$i]} -s 1 2>> perf_stat_synapse_${ts[$i]}
    done
done
