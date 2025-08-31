FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y wget unzip lib32gcc-s1 && rm -rf /var/lib/apt/lists/*

WORKDIR /terraria

RUN wget https://terraria.org/system/dedicated_servers/archives/000/000/053/original/terraria-server-1449.zip -O server.zip \
    && unzip server.zip -d /terraria \
    && rm server.zip \
    && chmod +x /terraria/Linux/TerrariaServer.bin.x86_64

WORKDIR /world

EXPOSE 7777

ENTRYPOINT ["/terraria/Linux/TerrariaServer.bin.x86_64"]
