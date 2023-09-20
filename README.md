# Tutorials
This is the main repository for ML4GLand tutorials. We recommend either cloning this [repository locally](#running-tutorials-locally) or opening up notebooks in [Google Colab](#running-tutorials-on-colab).

# Where should I start?
The tutorials are designed to be standalone (i.e. you can run them without having to run any other tutorials). However, if you are new to ML4GLand, we recommend that you start with the [basic usage tutorial](https://github.com/ML4GLand/tutorials/blob/main/eugene/end_to_end/basic_usage_tutorial.ipynb). Once you are familiar with the basic concepts of EUGENe and ML4GLand, you can pick and choose the tutorials that are most relevant to your analysis goals. If you just want to work through all of them sequentially, we have presented them in a logical order below.

## Working with data
- [SeqData basics](): Coming soon!
- [SeqPro basics](): Coming soon!
- [Train-test splits](https://github.com/ML4GLand/tutorials/blob/main/eugene/preprocess/train_test_splits.ipynb): A notebook that walks you through how to create train-test splits with SeqData objects.
- [Working with motifs](): Coming soon!

## Training models
- [Instantiating models](https://github.com/ML4GLand/tutorials/blob/main/eugene/models/instantiating_models.ipynb): A detailed walkthrough of how to instantiate models in EUGENe, covering basic PyTorch integrations to importing custom architectures.
- [SeqData, PyTorch Lightning and EUGENe](https://github.com/ML4GLand/tutorials/tree/main/eugene/train/pytorch_lightning): Examples of interfacing SeqData and EUGENe with PyTorch Lightning to tackle different modeling tasks.

## Interpreting models
- [Filter interpretation](https://github.com/ML4GLand/tutorials/blob/main/seqexplainer/filter_interpretation.ipynb): A tutorial guide for interpreting the learned filters of a trained model. It includes some background on the analysis, a worked example, and a discussion of the results.
- [Attribution analysis](https://github.com/ML4GLand/tutorials/blob/main/seqexplainer/attribution_analysis.ipynb): A tutorial guide for performing attribution analysis on a trained model. The notebook will walk through the steps of performing the analysis and interpreting the results.
- [Sequence evolution](https://github.com/ML4GLand/tutorials/blob/main/seqexplainer/sequence_evolution.ipynb): A tutorial guide for for performing an in silico evolution analysis with a trained PyTorch model using SeqExplainer. The notebook will walk through the steps of performing the analysis and interpreting the results.

## Advanced topics
- [Hyperparameter optimization](https://github.com/ML4GLand/tutorials/blob/main/eugene/train/hyperparameter_optimization.ipynb): A brief tutorial on how to use EUGENe's built-in hyperparameter optimization functions.
- [Fine-tuning](): Coming soon!

# Running tutorials locally
The simplest way to get started is to first install EUGENe using the instructions found [here](https://eugene-tools.readthedocs.io/en/latest/installation.html), and then to clone this repository locally with the following command:

```bash
git clone https://github.com/ML4GLand/tutorials.git
```

This will make sure you have all the notebooks and data needed to run the tutorials.

# Running tutorials on Colab
If you don't have a GPU, or would like to avoid trying to install EUGENe in your workspace, you can easily open these tutorial notebooks on [Google Colab](https://colab.research.google.com/?utm_source=scs-index) with the following steps:

1. Open the [Google Colab](https://colab.research.google.com/?utm_source=scs-index) homepage.
2. Click on the `GitHub` tab.
3. Type in `ML4GLand/tutorials` in the search bar and hit enter. The notebooks in the repository should appear below.
4. Click on the notebook you would like to open. A new tab will open with the notebook loaded in Colab.
5. Happy coding!

# Questions?
If you have any questions about the tutorials, or would like to request a new tutorial, please open an issue on this repository. You can also start a discussion on the [ML4GLand forum](https://github.com/orgs/ML4GLand/discussions).

# Contributing
In the future, we will be adhering to the following tutorial structure. 

Each tutorial should be a self-contained folder with the following:

- the folder name is used for the future notebooks
- single python scripts with converted notebooks (name does not matter)
- metadata named `.meta.yaml` including following info:

```yaml
title: Sample notebooks
author: [User](contact)
created: YYYY-MM-DD
updated: YYYY-MM-DD
license: CC BY-SA
# multi-line
description: |
  This notebook will walk you through ...
requirements:
  - package  # with version if needed
# define supported - CPU|GPU|TPU
accelerator:
  - CPU
```