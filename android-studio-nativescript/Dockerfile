FROM abarbu/nativescript:1.4

MAINTAINER Andrei Barbu <andrei@0xab.com>

RUN apt-get install -y unzip x11-apps x11-utils && \
    curl 'https://dl.google.com/dl/android/studio/ide-zips/1.4.0.10/android-studio-ide-141.2288178-linux.zip' > /tmp/studio.zip && \
    unzip -d /opt /tmp/studio.zip && rm /tmp/studio.zip && \
    cd /usr/local/ && \
    wget http://dl.google.com/android/ndk/android-ndk-r10e-linux-x86_64.bin && \
    chmod +x android-ndk-r10e-linux-x86_64.bin && \
    ./android-ndk-r10e-linux-x86_64.bin && \
    rm android-ndk-r10e-linux-x86_64.bin

# Without this the studio might ask us to update the SDK on startup.
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /usr/local/android-sdk-linux/tools/android update sdk --filter tools,build-tools-23.0.1 --all --no-ui

# If you want a copy of the basic android project you can use this. It
# isn't necessary now that the relevant files have been extracted and
# placed into the HelloWorld example.
#
# RUN cd /tmp/ && \
#     tns create hello && \
#     cd hello && \
#     tns platform add android && \
#     npm install tns-android

RUN ln -s /src/AndroidStudioProjects ~/
ADD dot-AndroidStudio1.4.tar.gz /root/

VOLUME /src
WORKDIR /src
