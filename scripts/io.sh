#!/bin/sh


sloc=$1; shift  # common name of fs
loc=$1;  shift  # fs path

if test -z "$sloc"
then
  echo 'missing loc'
  exit
fi

if test -z "$loc"
then
  echo 'missing loc'
  exit
fi

cd $loc

file="$loc/dummy.dat"
dsize=$((1024*1024*16))  # size of data to I/O

node_1=$(cat $PBS_NODEFILE | sort | uniq | head -n 1)
node_2=$(cat $PBS_NODEFILE | sort | uniq | tail -n 1)

unset RADICAL_VERBOSE

if test $sloc = "local"
then
    node_2=$node_1
fi

echo "node 1: $node_1"
echo "node 2: $node_2"

for n in 16384 4096 1024 256 64 16 4
do
    if test -f $file.$n.done
    then
        echo "skip $n.*"
        continue
    fi
    cnt=0
    while test $cnt -lt 5
    do
        echo "n  : $n.$cnt"
      # ssh $node_1 radical-synapse-sample -o $dsize -O $file.$n.$cnt -b $n -s 10 > "jogs_plain_2.$cnt.$sloc.$n.w0.log"
      # ssh $node_1 radical-synapse-sample -i $dsize -I $file.$n.$cnt -b $n -s 10 > "jogs_plain_2.$cnt.$sloc.$n.r0.log"
      # ssh $node_2 radical-synapse-sample -i $dsize -I $file.$n.$cnt -b $n -s 10 > "jogs_plain_2.$cnt.$sloc.$n.r1.log"
      # ssh $node_2 radical-synapse-sample -i $dsize -I $file.$n.$cnt -b $n -s 10 > "jogs_plain_2.$cnt.$sloc.$n.r2.log"
        aprun -n 1 -d 1 -L $node_1 radical-synapse-sample -o $dsize -O $file.$n.$cnt -b $n -s 10 > "jogs_plain_2.$cnt.$sloc.$n.w0.log"
        aprun -n 1 -d 1 -L $node_1 radical-synapse-sample -i $dsize -I $file.$n.$cnt -b $n -s 10 > "jogs_plain_2.$cnt.$sloc.$n.r0.log"
        aprun -n 1 -d 1 -L $node_2 radical-synapse-sample -i $dsize -I $file.$n.$cnt -b $n -s 10 > "jogs_plain_2.$cnt.$sloc.$n.r1.log"
        aprun -n 1 -d 1 -L $node_2 radical-synapse-sample -i $dsize -I $file.$n.$cnt -b $n -s 10 > "jogs_plain_2.$cnt.$sloc.$n.r2.log"
        rm -f $file.$n.$cnt
        cnt=$((cnt+1))
    done
    touch $file.$n.done

done

