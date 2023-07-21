# tutorials

Each tutorial addition should be formed as a new folder

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