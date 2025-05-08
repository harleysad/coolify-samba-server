FROM alpine:latest

# Instala os pacotes necessários
RUN apk add --no-cache \
    bash \
    iproute2 \
    iputils \
    net-tools \
    busybox-extras

# Cria um diretório vazio apenas para manter o container rodando
RUN mkdir /keepalive

# Define o diretório de trabalho
WORKDIR /keepalive

# Comando para manter o container rodando
CMD ["tail", "-f", "/dev/null"]
