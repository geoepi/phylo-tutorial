#!/bin/bash

#SBATCH --job-name=sat2

#SBATCH -N 1

#SBATCH -n 12

#SBATCH -t 1:59:00

#SBATCH --mem-per-cpu=15000M

module load java

~/beast/bin/beast -threads 12 sat2.xml
