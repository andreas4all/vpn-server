FROM alpine:3.10

EXPOSE 1194
EXPOSE 9001/tcp

RUN apk update \
    && apk upgrade \
    && apk add openvpn supervisor \
    && rm /var/cache/apk/*

VOLUME /var/log/openvpn
VOLUME /etc/supervisor.d

CMD supervisord -c /etc/supervisord.conf
