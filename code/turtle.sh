#!/bin/bash
## echo $(pwd)  -> "/__w/prepareData/prepareData"

# First, install packages
R -e "install.packages('faraway')"
# 
mkdir -p ./data/turtle
R -f ./code/turtle.R




