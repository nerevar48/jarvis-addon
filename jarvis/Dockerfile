ARG BUILD_FROM
FROM $BUILD_FROM

# Debian-based — glibc уже есть, libvosk.so работает без проблем
RUN apt-get update && apt-get install -y --no-install-recommends \
    openjdk-21-jre-headless \
    wget \
    unzip \
    libstdc++6 \
    && rm -rf /var/lib/apt/lists/*

ARG BUILD_ARCH=aarch64
RUN if [ "$BUILD_ARCH" = "aarch64" ]; then VOSK_ARCH="aarch64"; else VOSK_ARCH="x86_64"; fi && \
    wget -q -O /tmp/vosk.zip \
        "https://github.com/alphacep/vosk-api/releases/download/v0.3.45/vosk-linux-${VOSK_ARCH}-0.3.45.zip" && \
    unzip -q /tmp/vosk.zip -d /tmp/vosk && \
    cp /tmp/vosk/*/libvosk.so /usr/local/lib/ && \
    ldconfig && \
    rm -rf /tmp/vosk /tmp/vosk.zip

WORKDIR /app
COPY jarvis.jar .
COPY run.sh /etc/services.d/jarvis/run
RUN chmod +x /etc/services.d/jarvis/run