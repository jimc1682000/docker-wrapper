#!/bin/bash
#load some basic config
. wrapper.cfg
echo "start pulling..."
for PACKAGE in $PACKAGE_LIST
do
  IFS=':' read -r -a PACK <<< "$PACKAGE"
  PACKAGE_NAME=${PACK[0]}
  PACKAGE_VER=${PACK[1]}
  echo "docker pull $DOCKER_REG_URI/$PACKAGE_NAME:$PACKAGE_VER"
  docker pull $DOCKER_REG_URI/$PACKAGE_NAME:$PACKAGE_VER
done
echo "done"
