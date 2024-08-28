#!/bin/bash

#SBATCH --job-name=sat1

#SBATCH -N 1

#SBATCH -n 12

#SBATCH -t 1:59:00

#SBATCH --mem-per-cpu=15000M

module load java

~/beast/bin/beast -beagle-sse -threads 12 phylo-demo/sat1.xml
