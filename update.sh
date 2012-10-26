#!/bin/bash

git submodule foreach git pull origin master

mod_dir=`git submodule | awk '{print $2}'`

all_dir=`ls bundle`

for i in $all_dir
do
    dir_now="bundle/${i}"
    #echo $dir_now
    if [[ $mod_dir =~ $dir_now ]]; then
        echo "This is git submodule, updated"
    else 
        echo "manual updated, $dir_now"
    fi
done
