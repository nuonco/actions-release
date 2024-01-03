#!/bin/bash

if [ -n $BUILD_ID ]
then
  nuon releases create -j -b $BUILD_ID --delay $DELAY --installs-per-step $INSTALLS_PER_STEP | jq -r '"RELEASE_ID=\(.id)"' >> $GITHUB_OUTPUT
elif [ -n $COMPONENT_ID ]
then
  nuon releases create -j -b $COMPONENT_ID --delay $DELAY --installs-per-step $INSTALLS_PER_STEP | jq -r '"RELEASE_ID=\(.id)"' >> $GITHUB_OUTPUT
else
  echo "Require either a build ID or component ID to create a release."
  exit 1
fi
