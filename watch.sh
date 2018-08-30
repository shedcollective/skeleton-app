#!/bin/bash

rm -rf assets/build/css assets/build/js
./node_modules/.bin/webpack -w
