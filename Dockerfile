FROM alpine:edge

RUN apk update
RUN apk upgrade
RUN apk add openvpn

EXPOSE 1194

RUN rm /var/cache/apk/*

ADD ./server.conf /etc/openvpn/server.conf
ADD ./ca.crt /etc/openvpn/ca.crt
ADD ./server.crt /etc/openvpn/server.crt
ADD ./server.key /etc/openvpn/server.key
ADD ./dh.pem /etc/openvpn/dh.pem
ADD ./ta.key /etc/openvpn/ta.key

VOLUME /var/log/openvpn

CMD openvpn --config /etc/openvpn/server.conf