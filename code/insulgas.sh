#!/bin/bash
echo $(pwd)

# First, install packages
R -e "install.packages('faraway')"
# 
R -f ./code/insulgas.R




