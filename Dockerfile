ARG PROMETHEUS_VERSION=2.32.1

FROM prom/prometheus:v$PROMETHEUS_VERSION

ARG PROM_UID=2060
ARG PROM_GID=2060

USER root

RUN addgroup nogroup \
  && addgroup -S -g $PROM_GID prometheus \
  && adduser -G prometheus -s /bin/false -S -H -u $PROM_UID prometheus \
  && sh -c "find / -user nobody -exec chown ${PROM_UID}:${PROM_GID} {} \; || true"

USER $PROM_UID
