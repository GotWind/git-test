#!/bin/bash
#commit to local responsity
echo $1
if [ -n "$1" ];then
    git add --all
    current=`date "+%Y-%m-%d %H:%M:%S"`
    git commit -m "$current $1"

    #update to fast port
    #git pull
    git push
else
    echo "commit message missing,pls add message"
fi
