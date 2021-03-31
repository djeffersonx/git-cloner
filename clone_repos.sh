#!/bin/bash
repos_file=${1:-"repos.txt"}

GIT_URL_REGEX="^(https|git)(:\/\/|@)([^\/:]+)[\/:]([^\/:]+)\/(.+).git$"

while read line || [ -n "$line" ];
do
	echo $line
	if [[ $line =~ $GIT_URL_REGEX ]]; then    
	    repo_name=${BASH_REMATCH[5]}
	    mkdir $repo_name
	    git clone $line $repo_name
	fi
	
done < "$repos_file"
