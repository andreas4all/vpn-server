# VPN server Docker image

## How to generate keys for server ?

Simple !

Clone Easy-RSA

```
git clone https://github.com/OpenVPN/easy-rsa.git
```

And start building certificates

```
cd ./easy-rsa/easyrsa3
./easyrsa init-pki
./easyrsa build-ca nopass
./easyrsa gen-dh
./easyrsa build-server-full vpn.domain.tld nopass
openvpn --genkey --secret keys/ta.key
```

## How to generate keys for client?

```
cd ./easy-rsa/easyrsa3
./easyrsa build-client-full client.vpn.domain.tld nopass
```

## Supervisord

Sample comfiguration you can find in `sample` directory.

## Container starting

```
docker run -d --privileged \
    -p 1194:1194/udp \
    -p 9001:9001/tcp \
    -v ~/tmp:/var/log/openvpn \
    -v $PWD/sample:/etc/supervisor.d \
    -e SUPERVISORD_USERNAME=admin \
    -e SUPERVISORD_PASSWORD=password \
    vpn:latest
```
