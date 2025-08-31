FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y unzip lib32gcc-s1 && rm -rf /var/lib/apt/lists/*

WORKDIR /terraria

COPY server.zip /terraria/

# Descompacta dentro do container
RUN unzip server.zip -d /terraria \
    && rm server.zip \
    && chmod +x /terraria/Linux/TerrariaServer.bin.x86_64

WORKDIR /world

EXPOSE 7777

ENTRYPOINT ["/terraria/Linux/TerrariaServer.bin.x86_64"]
