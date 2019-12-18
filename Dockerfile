FROM alpine:latest

RUN apk add --no-cache zip

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
