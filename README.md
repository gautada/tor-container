# tor

[Tor]((https://www.torproject.org) provides The Onion Router.  This service provides an exposable Tor router that is password protected so it could technically be used anywhere in the world.

Tor is free software and an open network that helps you defend against traffic analysis, a form of network surveillance that threatens personal freedom and privacy, confidential business activities and relationships, and state security.

## Distribution

Alpine Linux 3.8

## Pre-requisites

To expose the Tor router use the Dynamic DNS Client (dydns).

## Build

The standard docker build is used to build the tor.

```
$ docker build --build-arg ALPINE_TAG=3.14.2 --file Containerfile -tag tor:dev .
```

## Run

To run just make sure to expose TCP ports 9050 and 9051.

```
$ docker run --detach=true --dns=172.22.0.5 --hostname=tor.gautier.local --ip=172.22.0.20 --name=tor.gautier.docker --network=gautier.docker --publish=9050:9050/tcp --publish=9051:9051/tcp --restart=always tor:build
```

## Test

Tor project provides a central checkpoint to [validate working status](https://check.torproject.org).

-ip=172.22.0.12 --publish=9050:9050/tcp --publish=9051:9051/tcp

flip/flop
