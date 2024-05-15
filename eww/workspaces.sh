#!/bin/bash

which_workspaces=$(hyprctl workspaces -j | jq .[].id | sort -n)
current_workspace=$(hyprctl activeworkspace -j | jq .id)

for workspace in $which_workspaces ; do
    if [[ $current_workspace == $workspace ]] ; then
        echo  
    else
        echo 
    fi
done
