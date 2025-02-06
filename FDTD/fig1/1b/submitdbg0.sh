#!/bin/bash
#SBATCH -A p31865               # Allocation
#SBATCH -p short                # Queue
#SBATCH -t 2:00:00             # Walltime/duration of the job
#SBATCH --ntasks=192
#SBATCH --mem=10G               # Memory per node in GB needed for a job. Also see --mem-per-cpu
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ysu2024@u.northwestern.edu

# unload any modules that carried over from your command line session
module purge

# add a project directory to your PATH (if needed)

# load modules you need to use
module load mpi

# A command you actually want to execute:

cfgfile=conf0.cfg

mpirun /projects/p31209/angora/source/angora-0.22.5/angora $cfgfile
