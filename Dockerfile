ARG VERSION=latest

FROM debian:11-slim

WORKDIR /var/server
COPY scripts /var/scripts
RUN apt-get update -y && \
    apt-get install -y curl jq xz-utils
RUN V=$(sh /var/scripts/version.sh $VERSION); \
    curl -Lo server.tar.xz https://www.factorio.com/get-download/${V}/headless/linux64
RUN tar xJf server.tar.xz && \
    rm server.tar.xz
RUN chmod +x /var/server/factorio/bin/x64/factorio

VOLUME /var/save
VOLUME /var/mods
EXPOSE 34197
ENTRYPOINT ["/var/scripts/entrypoint.sh"]