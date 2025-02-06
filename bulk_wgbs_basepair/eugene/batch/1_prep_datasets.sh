#!/bin/bash
script_path=scripts/prep_dataset.sh

# Slurm settings
job_name=prep_dataset
partition=carter-compute
cpus_per_task=4
mem=64G
time="14-00:00:00"
output_path="/cellar/users/aklie/projects/ML4GLand/tutorials/bulk_wgbs_basepair/eugene/batch/slurm_logs/%x.%A.%a.out"
array="1-$num%$num"

# Inputs
path_tsv=$1
num=$(wc -l $path_tsv | cut -d' ' -f1)
concurrency=10
array="1-$num%$concurrency"

# Cmd
cmd="sbatch \
--job-name=$job_name \
--partition=$partition \
--account=$accounts \
--cpus-per-task=$cpus_per_task \
--gpus=$gpus \
--mem=$mem \
--time=$time \
--output=$output_path \
--array=$array \
$script_path $path_tsv"
echo -e "Running command:\n$cmd\n"
eval $cmd
