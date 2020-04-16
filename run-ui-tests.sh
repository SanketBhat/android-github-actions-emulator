#!/usr/bin/env bash

set -eu

# Give execute permission to gradlew
chmod +x gradlew

adb start-server

# run Android UI tests
./gradlew connectedAndroidTest
