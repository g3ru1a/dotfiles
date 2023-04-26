#! /bin/bash

folder=$1

if [ "$folder" == "" ]; then
   folder="~/Projects/mangadb-ui"
fi

webstorm.sh $folder &
sleep 5s
xdotool key super+f
google-chrome-stable &
sleep 1s
xdotool key super+shift+h
kitty $folder &
sleep 1s
xdotool key super+f
kitty $folder &
sleep 1s
xdotool key super+f

exit
