ARG BUILD_FROM
FROM $BUILD_FROM
RUN apk add --no-cache openjdk21-jre
WORKDIR /app
COPY jarvis.jar .
COPY run.sh .
RUN chmod +x run.sh
CMD ["/app/run.sh"]