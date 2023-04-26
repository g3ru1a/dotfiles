#! /bin/bash

folder=$1

if [ "$folder" == "" ]; then
   folder="/home/gerula/Projects/mangadb-api"
fi

phpstorm.sh $folder &
sleep 5s
xdotool key super+f

postman &
sleep 5s
xdotool key super+f
xdotool key super+shift+h

google-chrome-stable &
sleep 1s

kitty $folder &
sleep 1s
xdotool key super+f

exit
