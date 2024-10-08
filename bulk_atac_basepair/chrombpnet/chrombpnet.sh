#! /bin/bash

#####
# Script to run chrombpnet pipeline on single input sample in bam format
# USAGE: sbatch --job-name=K562_ATAC-seq_chrombpnet --account carter-gpu --partition carter-gpu --gpus=1 --output /cellar/users/aklie/projects/ML4GLand/tutorials/bulk_atac_basepair/chrombpnet/chrombpnet/%x.%A.out --mem=128G -n 4 -t 14-00:00:00 chrombpnet.sh
#####

# Date
date
echo -e "Job ID: $SLURM_JOB_ID\n"

# Set-up env
source activate chrombpnet
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/cellar/users/aklie/opt/miniconda3/envs/chrombpnet/lib
python -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"

# Path data (TODO: change to the path you want to store the data in)
path_data=/cellar/users/aklie/data/datasets/K562_ATAC-seq/data

# Run cmd
cmd="chrombpnet pipeline \
    -ibam $path_data/merged.bam \
    -d "ATAC" \
    -g $path_data/hg38.fa \
    -c $path_data/hg38.chrom.sizes \
    -p $path_data/ENCSR868FGK_K562_ATAC-seq_peaks.bed \
    -n $path_data/K562_ATAC-seq_negatives.chrombpnet.bed \
    -fl $path_data/fold_0.json \
    -b bias_model/models/K562_bias.h5 \
    -o chrombpnet"
echo -e $cmd
eval $cmd

# Date
date
