#! /bin/bash

#####
# Script to run bpnet-lite fit
# USAGE: sbatch --job-name=K562_ATAC-seq_bpnet-lite_bias_fit --account carter-gpu --partition carter-gpu --gpus=1 --output /cellar/users/aklie/projects/ML4GLand/tutorials/bulk_atac_basepair/bpnet-lite/%x.%A.out --mem=128G -n 4 -t 14-00:00:00 bias_fit.sh
#####

# Date
date
echo -e "Job ID: $SLURM_JOB_ID\n"

# Configure environment
source activate /cellar/users/aklie/opt/miniconda3/envs/eugene_tools

# params
in_json=/cellar/users/aklie/projects/ML4GLand/tutorials/bulk_atac_basepair/bpnet-lite/bias_fit.json
out_dir=/cellar/users/aklie/projects/ML4GLand/tutorials/bulk_atac_basepair/bpnet-lite/bias_model

# Make output directory
mkdir -p $out_dir

cd $out_dir
cmd="bpnet fit -p $in_json"
echo -e "Running command: $cmd"
eval $cmd

# Date
date
