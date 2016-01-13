FROM alpine:edge

RUN apk update
RUN apk upgrade
RUN apk add openvpn

EXPOSE 1194

RUN rm /var/cache/apk/*

ONBUILD ADD ./server.conf /etc/openvpn/server.conf
ONBUILD ADD ./ca.crt /etc/openvpn/ca.crt
ONBUILD ADD ./server.crt /etc/openvpn/server.crt
ONBUILD ADD ./server.key /etc/openvpn/server.key
ONBUILD ADD ./dh.pem /etc/openvpn/dh.pem
ONBUILD ADD ./ta.key /etc/openvpn/ta.key

VOLUME /var/log/openvpn

CMD openvpn --config /etc/openvpn/server.conf