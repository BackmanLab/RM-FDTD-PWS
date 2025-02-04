#! /bin/bash
#SBATCH -A p31865               # Allocation
#SBATCH -p normal                # Queue
#SBATCH --array=0-4             # Job array from 0 to 9
#SBATCH -t 4:00:00             # Walltime/duration of the job
#SBATCH --ntasks=400
#SBATCH --mem-per-cpu=1G               # Memory per node in GB needed for a job. Also see --mem-per-cpu
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ysu2024@u.northwestern.edu
#SBATCH  --job-name="angora_job_\${SLURM_ARRAY_TASK_ID}"
#SBATCH --output=angora_job_%A_%a.out # %A is job ID and %a is array index
#SBATCH --error=angora_job_%A_%a.err  # Standard error file output
#SBATCH --constraint="[quest9|quest10|quest11|quest12]"



# unload any modules that carried over from your command line session
module purge

# add a project directory to your PATH (if needed)

# load modules you need to use
module load mpi

# A command you actually want to execute:

cfgfile=conf${SLURM_ARRAY_TASK_ID}.cfg

mpirun /projects/p31209/angora/source/angora-0.22.5/angora $cfgfile
