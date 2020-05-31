#!/bin/bash

echo " ---> Installing required packages"
apt-get -y install libssl-dev
apt-get -y install libz-dev

echo " ---> Detecting Name of Executable"
export PACKAGE_JSON=$(swift package dump-package)
export EXECUTABLE_NAME=$(curl -fsSL https://raw.githubusercontent.com/nerdsupremacist/heroku-graphzahl-buildpack/master/executableName.swift | swift -)
echo " ---> Detected executable: `$EXECUTABLE_NAME`"

# echo " ---> Compiling Application"
# swift package clean
# swift build -c debug -Xlinker -E

export EXECUTABLE_PATH=$(swift build -c debug --show-bin-path)/$EXECUTABLE_NAME
echo " ---> Will run application from: `$EXECUTABLE_PATH`"
