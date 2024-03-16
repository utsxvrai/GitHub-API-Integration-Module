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

# Set the token and rest api

token=$1
rest=$2

#active header for the request which is required for the github api also it tell the media type that is acceptable for the response
# here we are using the v3 version of the github api which is the latest version which will give json response
header="Accept: application/vnd.github.v3+json"  





