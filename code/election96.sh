#!/bin/bash
## echo $(pwd)  -> "/__w/prepareData/prepareData"

# First, install packages
R -e "install.packages('faraway')"
# 
mkdir -p ./data/election96
R -f ./code/election96.R




