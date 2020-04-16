#!/usr/bin/env bash

set -eu

# Give execute permission to gradlew
chmod +x gradlew

# run Android UI tests
./gradlew connectedAndroidTest
