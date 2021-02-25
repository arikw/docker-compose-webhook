ARG COMPOSE_VERSION=1.28.4
FROM docker/compose:$COMPOSE_VERSION

ARG WEBHOOK_VERSION=2.8.0

# install webhook
RUN apk add --no-cache curl && \
    curl -L -o /tmp/webhook-${WEBHOOK_VERSION}.tar.gz https://github.com/adnanh/webhook/releases/download/${WEBHOOK_VERSION}/webhook-linux-386.tar.gz && \
    tar -xvzf /tmp/webhook-*.tar.gz -C /tmp && \
    mv -f /tmp/webhook-*/webhook /usr/local/bin/webhook && \
    rm -rf /tmp/*

LABEL \
  org.opencontainers.image.authors="Arik Weizman" \
  org.opencontainers.image.description="This docker image installs webhook on top of the docker/compose image" \
  org.opencontainers.image.licenses="MIT" \
  org.opencontainers.image.source="https://github.com/arikw/docker-compose-webhook" \
  org.opencontainers.image.title="Docker Compose & Webhook image" \
  org.opencontainers.image.version="docker-compose ${COMPOSE_VERSION} with webhook ${WEBHOOK_VERSION}"

ENTRYPOINT [ "webhook" ]