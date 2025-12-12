# syntax=docker/dockerfile:1

ARG VERSION=2
FROM caddy:${VERSION}-builder AS builder
ARG VERSION

RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    xcaddy build v${VERSION} \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2@v2.10.0 \
    --with github.com/caddy-dns/cloudflare@v0.2.2

FROM caddy:${VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
