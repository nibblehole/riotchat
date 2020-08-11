#!/usr/bin/env bash

set -euf -o pipefail

# This line will only work in scripts and not sourced bash scripts.
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P  )"

PREVIOUS_CONTENTS=$(< $SCRIPTPATH/riot-web/node_modules/matrix-react-sdk/src/usercontent/index.js)

if [[ $PREVIOUS_CONTENTS == *"require('../../../../src/nextcloudnonce.js')"* ]]; then
	exit 0
fi

echo -en "require('../../../../src/nextcloudnonce.js')" "\n" "\n" "$PREVIOUS_CONTENTS" > $SCRIPTPATH/riot-web/node_modules/matrix-react-sdk/src/usercontent/index.js
