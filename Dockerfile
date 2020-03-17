FROM vgaidarji/docker-android-emulator:v1.0.1

ENV ANDROID_SDK_ROOT=/root/.android/ 
COPY ui-tests-on-emulator.sh /usr/bin/ui-tests-on-emulator
COPY run-ui-tests.sh /usr/bin/run-ui-tests
COPY kill-running-emulators.sh /usr/bin/kill-running-emulators
COPY wait-for-emulator.sh /usr/bin/wait-for-emulator
COPY unlock-emulator-screen.sh /usr/bin/unlock-emulator-screen
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["ui-tests-on-emulator"]
