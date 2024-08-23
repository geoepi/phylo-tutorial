#!/bin/bash

#SBATCH --job-name=sat1

#SBATCH -N 1

#SBATCH -n 12  

#SBATCH -t 1:59:00  

#SBATCH --mem-per-cpu=15000M   

module load beast
<<<<<<< HEAD
beast -beagle_sse sat1_beauti.xml 
=======
beast -beagle_sse old_beauti_sat1.xml 
>>>>>>> 9ebb1918f89f09cd4329fae99f97e3195780f00c

                           