FROM debian:sid-slim
#RUN apt-get update & apt-get install -y extra-runtime-dependencies & rm -rf /var/lib/apt/lists/*
RUN apt-get update
RUN apt-get install -y curl 
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /usr/bin
#COPY target/release/pax-to-docdb pax-to-docdb
COPY target/debug/pax-to-docdb pax-to-docdb
ENV LISTEN_PORT=8080
ENV DATABASE_NAME=mongodb

ENTRYPOINT pax-to-docdb exit --bind-addr 0.0.0.0:${LISTEN_PORT} --target-addr ${DATABASE_HOSTNAME}:27017
