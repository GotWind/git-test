#!/bin/bash
#commit to local responsity
echo $1
echo $2
if [ "$1" = "-h" -o "$1" = "--help" ];then
    echo "usage:./update.sh %"commit message %" -p"
    exit 1
fi
if [ -n "$1" ];then
    git add --all
    current=`date "+%Y-%m-%d %H:%M:%S"`
    git commit -m "$current $1"

    #update to fast port
    if [ "$2" = "-p" ];then
        #git pull
        git push
	echo "push"
    else
	echo "not push"
    fi
else
    echo "Required parameter missing"
    echo "usage:./update.sh "commit message" -p"
fi
