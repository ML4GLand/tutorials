#!/bin/bash
script_path=scripts/fit.sh

# Slurm settings
job_name=bias_fit
partition=carter-gpu
account=carter-gpu
cpus_per_task=4
gpus="a30:1"
mem=32G
time="14-00:00:00"
output_path="/cellar/users/aklie/projects/ML4GLand/tutorials/bulk_atac_basepair/eugene/batch/slurm_logs/%x.%A.%a.out"

# Inputs
path_tsv=$1
num_fits=$(wc -l $path_tsv | cut -d' ' -f1)
concurrency=10
array="1-$num_fits%$concurrency"

# Cmd
cmd="sbatch \
--job-name=$job_name \
--partition=$partition \
--account=$account \
--cpus-per-task=$cpus_per_task \
--gpus=$gpus \
--mem=$mem \
--time=$time \
--output=$output_path \
--array=$array \
$script_path $path_tsv"
echo -e "Running command:\n$cmd\n"
eval $cmd