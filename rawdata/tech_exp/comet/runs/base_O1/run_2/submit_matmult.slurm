#!/bin/bash

#SBATCH --partition=compute             # Partition (job queue)
#SBATCH --job-name=gmdrun               # Assign an 8-character name to your job
#SBATCH --nodes=1                       # Number of nodes
#SBATCH --ntasks=1                      # Processes (usually cores) on each node
#SBATCH --cpus-per-task=1               # Threads per process (or per core)
#SBATCH --mem=8000                      # Memory per node (MB)
#SBATCH --time=48:00:00                 # Total run time limit (HH:MM:SS)
#SBATCH --output=slurm.%N.%j.out        # combined STDOUT and STDERR output file
#SBATCH --export=ALL                    # Export you current env to the job env

module load python/2.7.10

echo $SLURM_SUBMIT_DIR
srun run_test_matmult.sh $SLURM_SUBMIT_DIR
