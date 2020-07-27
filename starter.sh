#!/bin/bash

function wait_emulator_to_be_ready() {  
  adb devices | grep emulator | cut -f1 | while read line; do adb -s $line emu kill; done
  emulator -avd "${EMULATOR_NAME_ARM}" -verbose -no-boot-anim -no-window -gpu off & adb wait-for-device
}

function disable_animation() {
  adb shell "settings put global window_animation_scale 0.0"
  adb shell "settings put global transition_animation_scale 0.0"
  adb shell "settings put global animator_duration_scale 0.0"
}

wait_emulator_to_be_ready
#wait 600 seconds to emulator become interactive
sleep 600

adb devices
adb kill-server
adb start-server
adb devices

disable_animation
