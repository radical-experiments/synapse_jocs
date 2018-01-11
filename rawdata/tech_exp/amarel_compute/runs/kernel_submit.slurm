#!/bin/bash

#/usr/bin/env bash

#SBATCH --partition=main
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4000
#SBATCH --time=48:00:00
#SBATCH --exclusive
#SBATCH --exclude=hal[0001-0075],gpu[001-006],mem[001-002],pascal[001-005],slepner[0009-0058],slepner[0085-0088]
#SBATCH --output=slurm-%j.out

srun run_test_matmult.sh
