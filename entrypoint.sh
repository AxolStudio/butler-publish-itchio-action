#!/bin/sh
set -e

dnf install unzip -y

curl -L -o butler.zip "https://broth.itch.ovh/butler/${BUTLER_VER}/LATEST/archive/default"
unzip butler.zip
chmod +x butler*

butler -V

export BUTLER_API_KEY=$BUTLER_CREDENTIALS

versionArgument=""

if [ "$VERSION" != "" ]
then
    versionArgument="--userversion ${VERSION}"
elif [ "$VERSION_FILE" != "" ]
then
    versionArgument="--userversion-file ${VERSION_FILE}"
fi

echo "butler push \"$PACKAGE\" $ITCH_USER/$ITCH_GAME:$CHANNEL ${versionArgument}"
butler push "$PACKAGE" $ITCH_USER/$ITCH_GAME:$CHANNEL ${versionArgument}
