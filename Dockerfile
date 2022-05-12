# Build Stage
FROM --platform=linux/amd64 ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y gcc

## Add source code to the build stage.
ADD . /adpcm-xq
WORKDIR /adpcm-xq

## TODO: ADD YOUR BUILD INSTRUCTIONS HERE.
RUN gcc *.c -o adpcm-xq

#Package Stage
FROM --platform=linux/amd64 ubuntu:20.04

## TODO: Change <Path in Builder Stage>
COPY --from=builder /adpcm-xq/adpcm-xq /
