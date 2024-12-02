#!/bin/bash

#####
# USAGE:
# sbatch fit.sh --SLURM_SETINGS ... <path_tsv>
#####

# Date
date
echo -e "Job ID: $SLURM_JOB_ID\n"

# Configuring env (choose either singularity or conda)
source activate /cellar/users/aklie/opt/miniconda3/envs/eugene_tools
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/opt/miniconda3/lib/

# Inputs
path_tsv=$1
params_options=($(cut -f1 $path_tsv))
path_outs=($(cut -f2 $path_tsv))
params=${params_options[$SLURM_ARRAY_TASK_ID-1]}
path_out=${path_outs[$SLURM_ARRAY_TASK_ID-1]}

# Echo inputs
echo -e "params: $params"
echo -e "path_out: $path_out\n"

# Make the output directory if it doesn't exist
mkdir -p $path_out

# Run the command
cmd="eugene fit bpnet-lite \
--params $params \
--path_out $path_out \
--report \
--random-state 1234"
echo -e "Running command: $cmd"
eval $cmd

# Date
date
