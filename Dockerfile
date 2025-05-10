FROM debian:bullseye-slim

LABEL maintainer="seu_nome@example.com"

# Instalar dependências e strongSwan com suporte a XAuth
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    strongswan libstrongswan-extra-plugins iproute2 iptables && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copiar os arquivos de configuração
COPY ipsec.conf /etc/ipsec.conf
COPY ipsec.secrets /etc/ipsec.secrets
COPY ipsec.user /etc/ipsec.d/passwd

# Ativar o plugin xauth-pam ou xauth-generic
RUN echo "load = aes des sha1 sha2 md5 gmp random nonce x509 revocation constraints pubkey pkcs1 pem hmac stroke kernel-netlink xauth-generic" > /etc/strongswan.d/charon/charon.conf

# Expor as portas necessárias
EXPOSE 500/udp 4500/udp

CMD ["ipsec", "start", "--nofork"]
