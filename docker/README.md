# docker

## environment

```bash
mac$ eval $(docker-machine env)
```

## build

```bash
mac$ cd docker
mac$ docker build -t test/hubot:1.0 .
mac$ docker images
```

## run

```bash
mac$ docker run -v /Users/syasu/hubot-test/sample_scripts:/mnt/sample_scripts -d -i -t test/hubot:1.0 /bin/bash
```

## attach

```bash
mac$ docker ps
CONTAINER ID        IMAGE               COMMAND ...
303f18d12af1        test/hubot:1.0      "/bin/bash" ...
mac$ docker attach 303f18d12af1
```

## hubot

```bash
container$ bin/hubot
hubot> hubot ping
hubot> PONG
```

## detach

```bash
container$
Ctrl-p + Ctrl-q
```

