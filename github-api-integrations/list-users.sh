#!/bin/bash

###########################################################
# Author  - Deepak Sharma
# Descriptions:- To get information about all contributors of our repo 
# To use our script , we need to first export two variable
# 1. Github username    
# 2. Token (to authenticate our repo and find details of all contributors )

# To use script :- 
# export username="deepaksharma2007"
# export token="<write-classic-token>"

# To execute script , we need to provide two arguments :- Owner & Repo name 
# ./list-users.sh   deepaksharma2007   shell_scripting
#############################################################

helper()

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
USERNAME=$username
TOKEN=$token

# User and Repository information
REPO_OWNER=$1
REPO_NAME=$2

# Function to make a GET request to the GitHub API
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # Send a GET request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access to the repository
function list_users_with_read_access {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # Fetch the list of collaborators on the repository
    collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

    # Display the list of collaborators with read access
    if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
    fi
}

function helper{
 expected_cmd_arg=2

 if [ $#  -ne $expected_cmd_arg]: then
    echo "please execute script with required argument"
    echo " Ex:- ./list-users.sh   <github-username>  <repo-name>"
}
# Main script

echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access
