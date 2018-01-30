FROM openjdk:alpine

ENV CEREBRO_VERSION 0.7.2

RUN apk update && apk upgrade && \
    apk add --no-cache bash \
    && mkdir -p /opt/cerebro/logs \
    && wget -O cerebro-${CEREBRO_VERSION}.tgz https://github.com/lmenezes/cerebro/releases/download/v${CEREBRO_VERSION}/cerebro-${CEREBRO_VERSION}.tgz \
    && tar zxvf cerebro-${CEREBRO_VERSION}.tgz -C /opt/cerebro --strip 1 \
    && rm cerebro-${CEREBRO_VERSION}.tgz

WORKDIR /opt/cerebro
EXPOSE 9000
CMD ["./bin/cerebro"]
