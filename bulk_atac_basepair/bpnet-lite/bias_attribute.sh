#! /bin/bash

#####
# Script to run bpnet-lite attribute
# USAGE: sbatch --job-name=K562_ATAC-seq_bpnet-lite_bias_attribute --account carter-gpu --partition carter-gpu --gpus=1 --output /cellar/users/aklie/projects/ML4GLand/tutorials/bulk_atac_basepair/bpnet-lite/%x.%A.out --mem=128G -n 4 -t 14-00:00:00 bias_attribute.sh
#####

# Date
date
echo -e "Job ID: $SLURM_JOB_ID\n"

# Configure environment
source activate /cellar/users/aklie/opt/miniconda3/envs/eugene_tools

# params
profile_json=/cellar/users/aklie/projects/ML4GLand/tutorials/bulk_atac_basepair/bpnet-lite/bias_attribute_profile.json
counts_json=/cellar/users/aklie/projects/ML4GLand/tutorials/bulk_atac_basepair/bpnet-lite/bias_attribute_counts.json
out_dir=/cellar/users/aklie/projects/ML4GLand/tutorials/bulk_atac_basepair/bpnet-lite/bias_model/auxiliary/interpret_subsample

# Make output directory
mkdir -p $out_dir

# Change to output directory
cd $out_dir

# Run cmd
cmd="bpnet attribute -p $profile_json"
echo -e "Running command: $cmd"
eval $cmd

cmd="bpnet attribute -p $counts_json"
echo -e "Running
command: $cmd"

# Date
date
