## SimpleDiskEnvFit example to submit fitting job on SLURM
##
## Run fitting on 80 cores of 2 nodes.
##
## Tested on ccas cluster at MPCDF

#!/bin/bash -l
#
#SBATCH --job-name=faust-elias29
#SBATCH --time=24:00:00
#SBATCH --partition=ccas256
#SBATCH --ntasks-per-node=40
#SBATCH --nodes=2
#SBATCH --mem=5gb

date

## Load required software
module load intel
module load mkl
module load fftw
module load impi
module load anaconda

## Make sure that site-packages are available
export PYTHONPATH=$PYTHONPATH:~/.local/lib/python2.7/site-packages
## Make sure that radmc3d binary is avaialble
export PATH=$PATH:~/bin

# Change to model directory, this is used as resource_dir in SimpleDiskEnvFit
cd ~/elias29
pwd

echo "Starting thread:" $SLURM_ARRAY_TASK_ID

srun -n 80 python fit_elias29.py
