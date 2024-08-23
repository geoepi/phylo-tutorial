#!/bin/bash

#SBATCH --job-name=sat_mcc

#SBATCH -N 1

#SBATCH -n 12  

#SBATCH -t 1:59:00  

#SBATCH --mem-per-cpu=15000M   

module load beast
beast -treeannotator -burnin 100 -heights median aligned_SAT1.trees.txt sat1_mcc.tre

                           