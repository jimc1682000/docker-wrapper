#!/bin/bash
#load some basic config
. wrapper.cfg
DT=$(date '+%Y%m%d%H%M%S');
echo "start wrapping..."
for dir in `find $DIR_PRE* -maxdepth 1 -type d`
do
  echo "zip $DIR_PRE$DT $dir/*"
  zip -0 $DIR_PRE$DT $dir/*
  echo "sudo rm -rf $dir??"
  #echo $MYPASSWD | sudo rm -rf $dir
done
echo "done"
