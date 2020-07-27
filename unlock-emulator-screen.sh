#!/usr/bin/env bash

set -eu

# Unlock the Lock Screen
adb shell input keyevent 82 &
adb shell input keyevent 4 &
