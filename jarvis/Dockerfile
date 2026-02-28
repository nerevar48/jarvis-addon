ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache openjdk21-jre wget unzip

RUN if [ "$BUILD_ARCH" = "aarch64" ]; then \
        wget -q -O /tmp/vosk.zip \
            https://github.com/alphacep/vosk-api/releases/download/v0.3.45/vosk-linux-aarch64-0.3.45.zip; \
    else \
        wget -q -O /tmp/vosk.zip \
            https://github.com/alphacep/vosk-api/releases/download/v0.3.45/vosk-linux-x86_64-0.3.45.zip; \
    fi && \
    unzip -q /tmp/vosk.zip -d /tmp/vosk && \
    cp /tmp/vosk/*/libvosk.so /usr/lib/ && \
    ldconfig /usr/lib 2>/dev/null || true && \
    rm -rf /tmp/vosk /tmp/vosk.zip

WORKDIR /app
COPY jarvis.jar .

# s6-overlay: скрипт запуска сервиса
COPY run.sh /etc/services.d/jarvis/run
RUN chmod +x /etc/services.d/jarvis/run