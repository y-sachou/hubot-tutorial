# vagrant

## 事前準備

- インストール

```bash
mac$ brew cask install vagrant virtualbox
```

- centos/7のboxダウンロード
```bash
mac$ vagrant box add --provider virtualbox centos/7
==> box: Loading metadata for box 'centos/7'
    box: URL: https://atlas.hashicorp.com/centos/7
==> box: Adding box 'centos/7' (v1605.01) for provider: virtualbox
    box: Downloading: https://atlas.hashicorp.com/centos/boxes/7/versions/1605.01/providers/virtualbox.box
==> box: Successfully added box 'centos/7' (v1605.01) for 'virtualbox'!
```

- boxの確認

```bash
mac$ vagrant box list
centos/7             (virtualbox, 1605.01)
```

## up

```bash
mac$ cd vagrant
mac$ vagrant up
```
up時にmount関連でエラーが出てしまう場合は、Vagrantfileのsynced_folderの行を削除して、vagrant destroyしてvagrant upしなおしてみてください。

## login

```bash
mac$ vagrant ssh
```

## hubot

```bash
vagrant% sudo su hubot
vagrant$ cd ~hubot/bot
vagrant$ bin/hubot
hubot> hubot ping
hubot> PONG
```

## logout

```bash
vagrant$ exit
vagrant% exit
```
