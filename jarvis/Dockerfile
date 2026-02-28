ARG BUILD_FROM
ARG BUILD_ARCH=aarch64
FROM $BUILD_FROM

# Устанавливаем glibc совместимость для Alpine (нужна для libvosk.so)
RUN apk add --no-cache wget unzip gcompat libstdc++

# Java 21
RUN apk add --no-cache openjdk21-jre

# Скачиваем libvosk.so под нужную архитектуру
RUN if [ "$BUILD_ARCH" = "aarch64" ]; then \
        VOSK_ARCH="aarch64"; \
    else \
        VOSK_ARCH="x86_64"; \
    fi && \
    wget -q -O /tmp/vosk.zip \
        "https://github.com/alphacep/vosk-api/releases/download/v0.3.45/vosk-linux-${VOSK_ARCH}-0.3.45.zip" && \
    unzip -q /tmp/vosk.zip -d /tmp/vosk && \
    cp /tmp/vosk/*/libvosk.so /usr/local/lib/ && \
    rm -rf /tmp/vosk /tmp/vosk.zip

ENV LD_LIBRARY_PATH=/usr/local/lib

WORKDIR /app
COPY jarvis.jar .

COPY run.sh /etc/services.d/jarvis/run
RUN chmod +x /etc/services.d/jarvis/run