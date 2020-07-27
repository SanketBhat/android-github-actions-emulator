#!/usr/bin/env bash

set -eu

# start android emulator
starter
unlock-emulator-screen
run-ui-tests
kill-running-emulators
