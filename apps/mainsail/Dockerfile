# syntax=docker/dockerfile:1

FROM node:22-alpine AS builder
ARG VERSION
RUN apk add zip
WORKDIR /app
ADD https://github.com/mainsail-crew/mainsail.git#${VERSION} .
RUN npm ci
RUN npm run build

FROM ghcr.io/nginxinc/nginx-unprivileged:1.27-alpine
ENV NGINX_ENTRYPOINT_WORKER_PROCESSES_AUTOTUNE=1
COPY --from=builder --chown=nginx:nginx /app/dist/ /usr/share/nginx/html/
USER nginx
WORKDIR /usr/share/nginx/html
