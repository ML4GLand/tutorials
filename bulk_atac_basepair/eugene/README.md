# Preparing the dataset
cd eugene/prep_dataset
eugene prep-dataset tracks -p K562_ATAC-seq.yaml -o ./ -r # add in -w if you want to overwrite existing files

# Fitting a bias model
cd eugene/bias_mdoel
eugene fit bpnet-lite -p K562_ATAC-seq_bias_0.5_fold_0.yaml -o ./fold_0/0.5 # add in -w if you want to overwrite existing files
