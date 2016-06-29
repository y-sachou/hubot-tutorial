# Hubot@vagrant

## 事前準備

- ツール群のインストール
  - できるだけ最新のものを使いましょう

```bash
mac $ brew cask install vagrant virtualbox
```

- centos/7のboxダウンロード

```bash
mac $ vagrant box add --provider virtualbox centos/7
==> box: Loading metadata for box 'centos/7'
    box: URL: https://atlas.hashicorp.com/centos/7
==> box: Adding box 'centos/7' (v1605.01) for provider: virtualbox
    box: Downloading: https://atlas.hashicorp.com/centos/boxes/7/versions/1605.01/providers/virtualbox.box
==> box: Successfully added box 'centos/7' (v1605.01) for 'virtualbox'!
```

- boxの確認

```bash
mac $ vagrant box list
centos/7             (virtualbox, 1605.01)
```

## 仮想OS起動、OS初期設定、Hubotインストール

```bash
mac $ cd vagrant
mac $ vagrant up
```

OS初期設定、Hubot関連ツールのインストールは、provisioning.shで実行しているので、vagrant up実行後はしばらく時間がかかります。mount関連でエラーが出る場合は、Vagrantfileのsynced_folderの行を削除してから、vagrant destroyで一度環境を破棄して、vagrant upを再度実行してみてください。

## Hubot起動、動作確認

```bash
mac $ vagrant ssh
vagrant % sudo su hubot
vagrant $ cd ~hubot/bot
vagrant $ bin/hubot
```

bin/hubot実行時にいくつか警告やエラーが画面に表示されますが、とりあえず気にしないでよいです。出力停止後、リターンを押すと、hubot>というプロンプトが出てきます。

```bash
hubot> hubot ping
hubot> PONG
```

hubotに向けて、pingのメッセージを送ると、PONGとレスポンスを返してくれれば、起動成功です。

## 簡単なスクリプト作成

/home/hubot/bot/scripts配下に、hogehoge.coffeeのようなスクリプトを設置して、hubotを再起動するとスクリプトが動くようになります。下記のサンプルスクリプトをコピペして設置してみてください。設置後は、hubotの再起動を忘れないように。

- [スクリプトサンプル](https://github.com/y-sachou/hubot-tutorial/tree/master/sample_scripts)
  - robot.respond : 呼びかけられた時に反応
  - robot.hear : キーワードが引っかかったら反応
  - msg.send : メッセージを出力
  - msg.reply : メッセージを返信

## Chatwork連携

Chatworkと連携するためには、3つの環境変数の設定が必要です。

- HUBOT_CHATWORK_TOKEN : APIトークン
- HUBOT_CHATWORK_ROOMS : 部屋番号
- HUBOT_CHATWORK_API_RATE : 1時間あたりのデータ取得回数
  - 現在、5分100回までという制限あり

- .envファイルを作成して環境変数を読み込む
  - .envファイルにはトークンが含まれます
  - 絶対にバージョン管理の対象には含めないでください

```bash
vagrant $ vi .env
export HUBOT_CHATWORK_TOKEN=xxxxxxxxxxxxxxxxxxxxxx
export HUBOT_CHATWORK_ROOMS=xxxxxxxxxx
export HUBOT_CHATWORK_API_RATE=420
vagrant $ eval $(cat .env)
```

chatworkアダプタを指定して、hubotを起動

```bash
vagrant $ bin/hubot -a chatwork
```

指定したROOM IDの部屋で、hubot pingという呼び掛けに、PONGが返却されれば成功。
