# Hubot@docker

## 事前準備

- ツール群のインストール
  - できるだけ最新のものを使いましょう

```bash
mac $ brew cask install dockertoolbox virtualbox
```

- docker-machineの作成

```bash
mac $ docker-machine create -d virtualbox default
Creating VirtualBox VM...
Creating SSH key...
Starting VirtualBox VM...
Starting VM...
To see how to connect Docker to this machine, run: docker-machine env default
```

- 確認

```bash
mac $ docker-machine ls
NAME ACTIVE DRIVER STATE URL SWARM
default virtualbox Running tcp://192.168.99.100:2376
```

- 環境設定

```bash
mac $ eval "$(docker-machine env default)"
```

- コンテナイメージのpull

```bash
mac $ docker pull centos:7
7: Pulling from library/centos
1544084fad81: Pull complete
df0fc3863fbc: Pull complete
a3d54b467fad: Pull complete
a65193109361: Pull complete
Digest: sha256:a9237ff42b09cc6f610bab60a36df913ef326178a92f3b61631331867178f982
Status: Downloaded newer image for centos:7
```

- コンテナの確認

```bash
mac $ docker images
REPOSITORY TAG IMAGE ID CREATED VIRTUAL SIZE
centos 7 a65193109361 3 weeks ago 196.8 MB
```

## コンテナ作成、OS初期設定、Hubotインストール

```bash
mac $ cd docker
mac $ docker build -t test/hubot:1.0 .
mac $ docker images
```

OS初期設定、Hubot関連ツールのインストールは、docker build時に実行しているので、しばらく時間がかかります。

## コンテナ起動とログイン

```bash
mac $ docker run -v /Users/syasu/hubot-test/sample_scripts:/mnt/sample_scripts -d -i -t test/hubot:1.0 /bin/bash
mac $ docker ps
CONTAINER ID        IMAGE               COMMAND ...
303f18d12af1        test/hubot:1.0      "/bin/bash" ...
mac $ docker attach 303f18d12af1
```

## Hubot起動、動作確認

```bash
container $ bin/hubot
```

bin/hubot実行時にいくつか警告やエラーが画面に表示されますが、とりあえず気にしないでよいです。出力停止後、リターンを押すと、hubot>とい>うプロンプトが出てきます。

```bash
hubot> hubot ping
hubot> PONG
```

hubotに向けて、pingのメッセージを送ると、PONGとレスポンスを返してくれれば、起動成功です。

## 簡単なスクリプト作成

/home/hubot/bot/scripts配下に、hogehoge.coffeeのようなスクリプトを>設置して、hubotを再起動するとスクリプトが動くようになります。下記のサンプルスクリプトをコピペして設置してみてください。設置後は、hubotの再起動を忘れないように。

- [スクリプトサンプル](https://github.com/y-sachou/hubot-tutorial/tree/master/sample_scripts)
  - robot.respond : 呼びかけられた時に反応
  - robot.hear : キーワードが引っかかったら反応
  - msg.send : メッセージを出力
  - msg.reply : メッセージを返信

## ログアウト

/bin/bashを実行するために起動したコンテナ状態のため、exitしてしまうとログインしてからログアウトするまでの作業が消えます。作業結果を残したいときは、detachしてからイメージをコミットしてください。

```bash
container $
Ctrl-p + Ctrl-q
```
