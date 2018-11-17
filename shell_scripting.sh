#!/bin/bash
#update date daily at 6:00 AM
#Author: Solomon Amos

DATE=`date "+%d-%m-%Y %a %p %l:%M %Z"`
Weather=$(curl wttr.in/?0?q?T | awk '/°(C|F)/ {printf $(NF-1) $(NF) " ("a")"} /,/ {a=$0}')
time=$(date +%d-%m-%Y).png

echo -e "* $DATE   : $Weather" | tee -a ~/projects/shell_scripting/README.md

date +%d-%m-%Y >> ~/projects/shell_scripting/weather.md

curl -L 'wttr.in/York.png' -o ~/projects/shell_scripting/img/$time
 
echo -e "\n![](img/$time)\n" >> ~/projects/shell_scripting/weather.md

cd ~/projects/shell_scripting
git init
git add .
git commit -m "update Today's log:)"
# git remote add origin https://github.com/udohsolomon/shell_scripting.git
git push -f origin master