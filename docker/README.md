# docker

## 事前準備

- インストール

```bash
$ brew cask install dockertoolbox virtualbox
```

- docker-machineの作成

```bash
$ docker-machine create -d virtualbox default
Creating VirtualBox VM...
Creating SSH key...
Starting VirtualBox VM...
Starting VM...
To see how to connect Docker to this machine, run: docker-machine env default
```

- 確認

```bash
$ docker-machine ls
NAME ACTIVE DRIVER STATE URL SWARM
default virtualbox Running tcp://192.168.99.100:2376
```

- 環境設定

```bash
$ eval "$(docker-machine env default)"
```

- コンテナpull

```bash
$ docker pull centos:7
7: Pulling from library/centos
1544084fad81: Pull complete
df0fc3863fbc: Pull complete
a3d54b467fad: Pull complete
a65193109361: Pull complete
Digest: sha256:a9237ff42b09cc6f610bab60a36df913ef326178a92f3b61631331867178f982
Status: Downloaded newer image for centos:7
```

- コンテナ確認

```bash
$ docker images
REPOSITORY TAG IMAGE ID CREATED VIRTUAL SIZE
centos 7 a65193109361 3 weeks ago 196.8 MB
```

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
