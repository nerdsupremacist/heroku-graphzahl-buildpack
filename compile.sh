#!/bin/bash

apt-get -y install libssl-dev
apt-get -y install libz-dev

curl https://raw.githubusercontent.com/nerdsupremacist/heroku-graphzahl-buildpack/master/executableName.swift > executableName.swift
export PACKAGE_JSON=$(swift package dump-package)
export EXECUTABLE_NAME=$(PACKAGE_JSON=$PACKAGE_JSON swift executableName.swift)
rm executableName.swift

swift package clean
swift build -c debug -Xlinker -E

export EXECUTABLE_PATH=./.build/debug$EXECUTABLE_NAME
