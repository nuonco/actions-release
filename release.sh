#!/bin/bash

if [ -z "$BUILD_ID" ]; then
    echo "releasing build \"$BUILD_ID\""
    nuon releases create -j -b $BUILD_ID --delay $DELAY --installs-per-step $INSTALLS_PER_STEP | jq -r '"RELEASE_ID=\(.id)"' >> $GITHUB_OUTPUT
elif [ -z "$COMPONENT_ID" ]; then
    echo "releasing latest build of component \"$COMPONENT_ID\""
    nuon releases create -j -b $COMPONENT_ID --delay $DELAY --installs-per-step $INSTALLS_PER_STEP --auto-build $AUTO_BUILD | jq -r '"RELEASE_ID=\(.id)"' >> $GITHUB_OUTPUT
else
    echo "Require either a build ID or component ID to create a release."
    exit 1
fi
