#!/bin/bash
set -e

source ~/.bashrc >/dev/null
eval "$(conda shell.bash hook)"
conda activate "$CONDA_ENV_NAME"

streamlit run src/main.py
