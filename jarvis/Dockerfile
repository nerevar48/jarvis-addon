ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base-debian:bookworm
FROM $BUILD_FROM

ARG BUILD_ARCH=aarch64

RUN apt-get update && apt-get install -y --no-install-recommends \
    openjdk-17-jre-headless \
    wget \
    unzip \
    libstdc++6 \
    && rm -rf /var/lib/apt/lists/*

RUN echo "BUILD_ARCH=${BUILD_ARCH}" && \
    if [ "${BUILD_ARCH}" = "aarch64" ]; then VOSK_ARCH="aarch64"; else VOSK_ARCH="x86_64"; fi && \
    wget -q -O /tmp/vosk.zip \
        "https://github.com/alphacep/vosk-api/releases/download/v0.3.45/vosk-linux-${VOSK_ARCH}-0.3.45.zip" && \
    unzip -q /tmp/vosk.zip -d /tmp/vosk && \
    cp /tmp/vosk/*/libvosk.so /usr/local/lib/ && \
    ldconfig && \
    rm -rf /tmp/vosk /tmp/vosk.zip

ENV LD_LIBRARY_PATH=/usr/local/lib

WORKDIR /app
COPY jarvis.jar .
COPY run.sh /etc/services.d/jarvis/run
RUN chmod +x /etc/services.d/jarvis/run