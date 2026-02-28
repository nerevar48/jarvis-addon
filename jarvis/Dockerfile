ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache openjdk21-jre jq

WORKDIR /app
COPY jarvis.jar .

# s6-overlay: скрипт запуска сервиса
COPY run.sh /etc/services.d/jarvis/run
RUN chmod +x /etc/services.d/jarvis/run