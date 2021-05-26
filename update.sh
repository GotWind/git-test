#!/bin/bash
#commit to local responsity
git add --all
current=`date "+%Y-%m-%d %H:%M:%S"`
git commit -m "$current"

#update to fast port
#git pull
git push
