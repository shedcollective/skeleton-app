#!/bin/bash -e

# --------------------------------------------------------------------------
# Watch JS and styles for changes
# --------------------------------------------------------------------------
rm -rf assets/build/css assets/build/js
yarn run watch
