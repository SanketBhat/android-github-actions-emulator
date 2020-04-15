FROM ubuntu

RUN apt-get update
RUN apt-get install -y tree openjdk-8-jdk wget unzip expect
RUN wget -O android-sdk.zip https://dl.google.com/android/repository/commandlinetools-linux-6200805_latest.zip
RUN unzip -q android-sdk.zip -d /sdk
RUN rm android-sdk.zip
ENV PATH=/sdk/tools/bin:$PATH
ENV ANDROID_HOME=/sdk

RUN yes | sdkmanager --sdk_root=${ANDROID_HOME} "tools"\
    "emulator" \
    "platform-tools" \
    "build-tools;29.0.3" \
    "platforms;android-29" \
    "system-images;android-29;google_apis;x86_64" \
    "extras;android;m2repository" \
    "extras;google;m2repository" \
    "extras;google;google_play_services" 

RUN yes | sdkmanager --licenses

ENV PATH=/sdk:/sdk/tools:/sdk/platform-tools:$PATH
ENV ANDROID_SDK_ROOT=$ANDROID_HOME
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/bin


COPY ui-tests-on-emulator.sh /usr/bin/ui-tests-on-emulator
COPY run-ui-tests.sh /usr/bin/run-ui-tests
COPY kill-running-emulators.sh /usr/bin/kill-running-emulators
COPY wait-for-emulator.sh /usr/bin/wait-for-emulator
COPY unlock-emulator-screen.sh /usr/bin/unlock-emulator-screen
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["ui-tests-on-emulator"]
