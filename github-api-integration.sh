#!/bin/zsh
################################
# Author: Utsav Rai
# Version: v1
#
#
#
# This script will help users to communicate and retrieve information from GitHub
# Usage:
#   Please provide your github token and rest api to the script as input
#
################################

if [ ${#@} -lt 2 ]; then
    echo "usage: $0 [your github token] [REST expression]"
    exit 1;
fi



