#!/bin/sh

for n in $*
do

    start=$(date +"%s")

    export OMP_NUM_THREADS="$n"

    full=40000000000
    part=$((full / $n))

    echo "n   : $n"
    echo "full: $full"
    echo "part: $part"

    aprun -n 1 -d $n -e OMP_NUM_THREADS="$n" radical-synapse-sample -f $full -s 18 > "jogs_plain_1.omp.0.$n.log" &
    aprun -n 1 -d $n -e OMP_NUM_THREADS="$n" radical-synapse-sample -f $full -s 18 > "jogs_plain_1.omp.1.$n.log" &
    aprun -n 1 -d $n -e OMP_NUM_THREADS="$n" radical-synapse-sample -f $full -s 18 > "jogs_plain_1.omp.2.$n.log" &
    aprun -n 1 -d $n -e OMP_NUM_THREADS="$n" radical-synapse-sample -f $full -s 18 > "jogs_plain_1.omp.3.$n.log" &
    aprun -n 1 -d $n -e OMP_NUM_THREADS="$n" radical-synapse-sample -f $full -s 18 > "jogs_plain_1.omp.4.$n.log" &
    aprun -n 1 -d $n -e OMP_NUM_THREADS="$n" radical-synapse-sample -f $full -s 18 > "jogs_plain_1.omp.5.$n.log" &
    aprun -n 1 -d $n -e OMP_NUM_THREADS="$n" radical-synapse-sample -f $full -s 18 > "jogs_plain_1.omp.6.$n.log" &
    aprun -n 1 -d $n -e OMP_NUM_THREADS="$n" radical-synapse-sample -f $full -s 18 > "jogs_plain_1.omp.7.$n.log" &
    aprun -n 1 -d $n -e OMP_NUM_THREADS="$n" radical-synapse-sample -f $full -s 18 > "jogs_plain_1.omp.8.$n.log" &
    aprun -n 1 -d $n -e OMP_NUM_THREADS="$n" radical-synapse-sample -f $full -s 18 > "jogs_plain_1.omp.9.$n.log" &

    aprun -n $n -d 1 -e OMP_NUM_THREADS="1"  radical-synapse-sample -f $part -s 18 > "jogs_plain_1.mpi.0.$n.log" &
    aprun -n $n -d 1 -e OMP_NUM_THREADS="1"  radical-synapse-sample -f $part -s 18 > "jogs_plain_1.mpi.1.$n.log" &
    aprun -n $n -d 1 -e OMP_NUM_THREADS="1"  radical-synapse-sample -f $part -s 18 > "jogs_plain_1.mpi.2.$n.log" &
    aprun -n $n -d 1 -e OMP_NUM_THREADS="1"  radical-synapse-sample -f $part -s 18 > "jogs_plain_1.mpi.3.$n.log" &
    aprun -n $n -d 1 -e OMP_NUM_THREADS="1"  radical-synapse-sample -f $part -s 18 > "jogs_plain_1.mpi.4.$n.log" &
    aprun -n $n -d 1 -e OMP_NUM_THREADS="1"  radical-synapse-sample -f $part -s 18 > "jogs_plain_1.mpi.5.$n.log" &
    aprun -n $n -d 1 -e OMP_NUM_THREADS="1"  radical-synapse-sample -f $part -s 18 > "jogs_plain_1.mpi.6.$n.log" &
    aprun -n $n -d 1 -e OMP_NUM_THREADS="1"  radical-synapse-sample -f $part -s 18 > "jogs_plain_1.mpi.7.$n.log" &
    aprun -n $n -d 1 -e OMP_NUM_THREADS="1"  radical-synapse-sample -f $part -s 18 > "jogs_plain_1.mpi.8.$n.log" &
    aprun -n $n -d 1 -e OMP_NUM_THREADS="1"  radical-synapse-sample -f $part -s 18 > "jogs_plain_1.mpi.9.$n.log" &

    while (ps | grep -c aprun )
    do
        sleep 10
    done
    stop=$(date +"%s")
    echo "ttc: $((stop-start))"
    echo

done

