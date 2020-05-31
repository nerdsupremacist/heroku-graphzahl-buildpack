#!/bin/bash

apt-get -y install libssl-dev
apt-get -y install libz-dev

export PACKAGE_JSON=$(swift package dump-package)
export EXECUTABLE_NAME=$(PACKAGE_JSON=$PACKAGE_JSON curl -fsSL https://raw.githubusercontent.com/nerdsupremacist/heroku-graphzahl-buildpack/master/executableName.swift > swift)

export EXECUTABLE_PATH=$(swift build -c debug --show-bin-path)/$EXECUTABLE_NAME
echo $EXECUTABLE_PATH

swift package clean
swift build -c debug -Xlinker -E

