#!/bin/bash
#load some basic config
. wrapper.cfg
DT=$(date '+%Y%m%d%H%M%S');
echo "start saving..."
echo "create folder $DIR_PRE$DT..."
mkdir $DIR_PRE$DT && cd $DIR_PRE$DT
for PACKAGE in $PACKAGE_LIST
do
  IFS=':' read -r -a PACK <<< "$PACKAGE"
  PACKAGE_NAME=${PACK[0]}
  PACKAGE_VER=${PACK[1]}
  echo "docker save $DOCKER_REG_URI/$PACKAGE_NAME:$PACKAGE_VER | gzip -c >  $PACKAGE_NAME.$PACKAGE_VER.tar.gz"
  docker save $DOCKER_REG_URI/$PACKAGE_NAME:$PACKAGE_VER | gzip -c > $PACKAGE_NAME.$PACKAGE_VER.tar.gz
  #remove empty file/extreme small file
  echo "find . -type f -size -3 -delete"
  find . -type f -size -3 -delete
done
echo "done"
