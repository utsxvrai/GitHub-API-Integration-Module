#!/bin/bash
################################
# Author: Utsav Rai
# Date : 16 March, 2024
# Version: v1
#
#
#
# This script will help users to communicate and retrieve information from GitHub
# Usage: Please provide your github token and rest api to the script as input
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


# temp file to store the response from the github api
temp=`basename $0`
tmpfile=`mktemp /tmp/${temp}.XXXXXX` || exit 1

#curl command to get the response from the github api
function get_response {
    curl -s $1 -H "${header}" -H "Authorization: token $token" >> $tmpfile
}

# single page result-s (no pagination), have no Link: section, the grep result is empty

last_page=`curl -s -I "https://api.github.com${rest}" -H "${header}" -H "Authorization: token $token" | grep '^Link:' | sed -e 's/^Link:.*page=//g' -e 's/>.*$//g'`


# if the last page is empty then we have only one page of result
if [ -z "$last_page" ]; then
    get_response "https://api.github.com${rest}"
else
    # if the last page is not empty then we have multiple pages of result
    for p in `seq 1 $last_page`; do
        get_response "https://api.github.com${rest}?page=$p"
    done
fi

# print the response from the github api
cat $tmpfile








