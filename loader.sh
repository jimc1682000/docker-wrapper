#!/bin/bash
#load some basic config
. wrapper.cfg
echo "start loading..."
for PACKAGE in $PACKAGE_LIST
do
  IFS=':' read -r -a PACK <<< "$PACKAGE"
  PACKAGE_NAME=${PACK[0]}
  PACKAGE_VER=${PACK[1]}
  echo "gunzip -c $PACKAGE_NAME.$PACKAGE_VER.tar.gz | docker load"
  gunzip -c $PACKAGE_NAME.$PACKAGE_VER.tar.gz | docker load"
done
echo "done"
