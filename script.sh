#!/bin/bash
# @param 
#   $1: dist folder name

if [[ ! $1 ]]; then
  echo "Please input dist folder name"
  exit 1
fi

if [[ ! -d dist ]]; then
  mkdir dist
fi

folderName=$1
if [[ ! -d dist/$folderName ]]; then
  mkdir dist/$folderName
fi

# escape space in file name
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for file in ./$folderName/*.*
do
  echo $file
  name=${file#./src}
  echo $name
  convert -resize 1280 -quality 80% $file "./dist/$name"
done

# for file in ./src/*.png
# do
#   echo $file
#   name=${file#./src}
#   echo $name
#   convert -resize 1280 -quality 90% +dither $file "dist/$name"
# done

IFS=$SAVEIFS

exit 0
