#!/bin/bash

#SBATCH --job-name=sat1

#SBATCH -N 1

#SBATCH -n 12  

#SBATCH -t 1:59:00  

#SBATCH --mem-per-cpu=15000M   

module load beast
beast -beagle_sse aligned_SAT1.xml 

                           