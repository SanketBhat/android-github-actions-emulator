#!/usr/bin/env bash

set -eu

ENV ANDROID_SDK_ROOT=/root/.android/ 
# start android emulator
START=`date +%s` > /dev/null

echo no | $ANDROID_HOME/tools/bin/avdmanager create avd --force -n test -k "system-images;android-21;google_apis;armeabi-v7a"
$ANDROID_HOME/tools/bin/avdmanager list avd
$ANDROID_HOME/tools/emulator -avd test -no-window -no-boot-anim -no-audio -verbose &
wait-for-emulator
unlock-emulator-screen

DURATION=$(( `date +%s` - START )) > /dev/null
echo "Android Emulator started after $DURATION seconds."

# emulator isn't ready yet, wait 1 min more
# prevents APK installation error
sleep 60

run-ui-tests

kill-running-emulators