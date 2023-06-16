#!/bin/bash

# set color variables
green=`echo -e "\033[32m"`
yellow=`echo -e "\033[33m"`
cyan=`echo -e "\033[36m"`
gray=`echo -e "\033[37m"`

# set snake properties
year=$(date +"%Y")
language="python"
username="biaov"

echo "${green}Cloning repo..."

# clone the git repository
git clone https://github.com/Platane/snk.git >/dev/null 2>&1

echo "${yellow}Creating snake..."

# generate the snake image
cd snk
python main.py \
  --year=$year \
  --language=$language \
  --username=$username \
  --pixel-size=10 \
  --bg-color="#282828" \
  --grid-color="#666666" \
  --snake-body-color="#c6e48b" \
  --snake-head-color="#a7d129" \
  --filename="./snake.svg" >/dev/null 2>&1

echo "${cyan}Pushing snake to Github..."

# push the generated image to your github repository
git config --global user.email "biaov@qq.com"
git config --global user.name "biaov"
git add snake.svg
git commit -m "Update snake" >/dev/null 2>&1
git push origin main >/dev/null 2>&1

echo "${gray}Done!"