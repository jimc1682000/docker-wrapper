#!/bin/bash
FOLDER=""
echo "start loading..."
for filename in $FOLDER/*
do
  echo "gunzip -c $filename | docker load"
  gunzip -c $filename | docker load
done
echo "done"
