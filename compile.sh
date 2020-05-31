#!/bin/bash

apt-get -y install libssl-dev
apt-get -y install libz-dev

export PACKAGE_JSON=$(swift package dump-package)
export EXECUTABLE_NAME=$(PACKAGE_JSON=$PACKAGE_JSON swift $(curl -fsSL https://raw.githubusercontent.com/nerdsupremacist/heroku-graphzahl-buildpack/master/executableName.swift))
rm executableName.swift

export EXECUTABLE_PATH=$(swift build -c release --show-bin-path)/$EXECUTABLE_NAME

swift package clean
swift build -c debug -Xlinker -E

