FROM sanketbhat7/docker-for-android:latest

ENV ANDROID_SDK_HOME=/root/.android/
ENV HOME=/root/
ENV ANDROID_AVD_HOME=/root/.android/avd

COPY ui-tests-on-emulator.sh /usr/bin/ui-tests-on-emulator
COPY run-ui-tests.sh /usr/bin/run-ui-tests
COPY kill-running-emulators.sh /usr/bin/kill-running-emulators
COPY unlock-emulator-screen.sh /usr/bin/unlock-emulator-screen
COPY starter.sh /usr/bin/starter
COPY entrypoint.sh /

RUN chmod +x /usr/bin/starter
ENTRYPOINT ["/entrypoint.sh"]
CMD ["ui-tests-on-emulator"]
