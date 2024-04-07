#!/bin/bash

if [ ! -z "$BUILD_ID" ]; then
    echo "releasing build \"$BUILD_ID\""
    nuon releases create -j -b $BUILD_ID --delay $DELAY --installs-per-step $INSTALLS_PER_STEP | jq -r '"RELEASE_ID=\(.id)"' >> $GITHUB_OUTPUT
    exit 0
fi


if [ ! -z "$COMPONENT_ID" ]; then
    if [ "$LATEST_BUILD" = "true" ]; then
      echo "releasing latest build of component \"$COMPONENT_ID\""
      nuon releases create -j -b $COMPONENT_ID \
        --delay $DELAY \
        --installs-per-step $INSTALLS_PER_STEP \
        --latest-build | jq -r '"RELEASE_ID=\(.id)"' >> $GITHUB_OUTPUT
      exit 0
    fi

    if [ "$AUTO_BUILD" = "true" ]; then
      echo "creating and releasing a new build of component \"$COMPONENT_ID\""
      nuon releases create -j -b $COMPONENT_ID \
        --delay $DELAY \
        --installs-per-step $INSTALLS_PER_STEP \
        --auto-build | jq -r '"RELEASE_ID=\(.id)"' >> $GITHUB_OUTPUT
      exit 0
    fi

    echo "Either latest_build or auto_build must be set to true."
    exit 1
fi

echo "Either a build ID or component ID must be provided to create a release."
exit 1
