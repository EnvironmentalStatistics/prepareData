#!/bin/bash
## echo $(pwd)  -> "/__w/prepareData/prepareData"

# First, install packages
R -e "install.packages('faraway')"
# 
mkdir -p ./data/insulgas
R -f ./code/insulgas.R




