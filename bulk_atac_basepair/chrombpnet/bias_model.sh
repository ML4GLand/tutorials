#! /bin/bash

#####
# Script to run chrombpnet bias model pipeline on single input sample in bam format
# USAGE: sbatch --job-name=K562_ATAC-seq_bias_model --account carter-gpu --partition carter-gpu --gpus=1 --output /cellar/users/aklie/projects/ML4GLand/tutorials/bulk_atac_basepair/chrombpnet/bias_model/%x.%A.out --mem=128G -n 4 -t 14-00:00:00 bias_model.sh
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
cmd="chrombpnet bias pipeline \
    -ibam $path_data/merged.bam \
    -d "ATAC" \
    -g $path_data/hg38.fa \
    -c $path_data/hg38.chrom.sizes \
    -p data/peaks_no_blacklist.bed \
    -n data/output_negatives.bed \
    -fl ../../data/splits/fold_0.json \
    -b 0.5 \
    -o bias_model \
    -fp K562"
echo -e $cmd
eval $cmd

# Date
date
