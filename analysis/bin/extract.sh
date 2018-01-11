#!/bin/sh


PWD=$(dirname $(readlink -f $(command -v -- $0)))
data=$PWD/../../rawdata
out=$PWD/../data/

mkdir -p $out

# ------------------------------------------------------------------------------
#

rm -f io.tmp

for host in $data/io/*
do
    host=$(basename $host)
    echo $host

    for log in $( ls $data/io/$host/*log 2>/dev/null | sort -n)
    do 
        logbase=$(basename $log)
        num=$(expr   $logbase : "jogs_plain_2.\([0-9]*\).*")
        fs=$(expr    $logbase : "jogs_plain_2.$num.\([a-z]*\).*")
        block=$(expr $logbase : "jogs_plain_2.$num.$fs.\([0-9]*\).*")
        mode=$(expr  $logbase : "jogs_plain_2.$num.$fs.$block.\([rw][0-2]\).*")
        real=$(grep real $log | rev | cut -f 3 -d ' ' | rev | xargs echo)           # all
        real=$(grep real $log | rev | cut -f 3 -d ' ' | rev | sort -n | tail -n 1)  # last

        for t in $real
        do
            t=$(echo $t | cut -f 1 -d ,)
            printf "\r  %-10s  %-7s  %2s  %6d  %2d  %8.2f"   $host $fs $mode $block $num $t
            printf     "%-10s  %-7s  %2s  %6d  %2d  %8.2f\n" $host $fs $mode $block $num $t >> io.tmp
        done
    done
    echo
done

sort -n io.tmp > $out/io.dat
rm io.tmp

# ------------------------------------------------------------------------------
#
rm -f omp.tmp

for host in $data/omp/*
do
    host=$(basename $host)
    echo $host

    for log in $( ls $data/omp/$host/*log 2>/dev/null | sort -n)
    do 
        logbase=$(basename $log)
        mode=$(expr $logbase : "jogs_plain_1.\([a-z]*\).*")
        num=$(expr $logbase : "jogs_plain_1.$mode.\([0-9]*\).*")
        n=$(expr $logbase : "jogs_plain_1.$mode.$num.\([0-9]*\).*")
        real=$(grep real $log | cut -f 5 -d ' ' | xargs echo)           # all
        real=$(grep real $log | cut -f 5 -d ' ' | sort -n | tail -n 1)  # last

        for t in $real
        do
            t=$(echo $t | cut -f 1 -d ,)
            printf "\r  %-10s  %-5s  %2d  %2d  %8.2f"   $host $mode $n $num $t
            printf     "%-10s  %-5s  %2d  %2d  %8.2f\n" $host $mode $n $num $t >> omp.tmp
        done
    done
    echo
done

sort -n omp.tmp > $out/omp.dat
rm omp.tmp
