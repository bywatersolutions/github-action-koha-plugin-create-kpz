FROM alpine:latest

RUN apk add --no-cache zip nodejs npm

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
