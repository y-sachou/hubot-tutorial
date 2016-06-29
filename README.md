# Hubot

## はじめに

- 目的
  - Hubotを知る
  - Hubotを動かしてみる

- やること
  - 環境構築
  - Hubotのインストールと起動
  - 簡単なスクリプト作成
  - Chatwork連携

- やらないこと
  - VagrantやDockerのこと
  - セキュリティとか

## Hubotとは？

- 概要
  - node.jsでbotを動かすためのフレームワーク
  - npmで拡張モジュールの導入が簡単
  - Adapterモジュールで様々なチャットツールに対応
  - CoffeeScriptかJavaScriptで機能追加

- できること
  - 定期的な告知
  - コマンドの実行結果を通知
  - スクリプトで書ければだいたいできる

- 活用例
  - AWS管理APIにEC2のアドレスを問い合わせてChatworkに通知
  - 天気予報サイトから情報取得して通知
  - 決まった単語に反応
    - おみくじ
    - さいころ

## チュートリアル

- 直接The Internetに接続できるネットワーク環境
- このリポジトリをcloneしておく
- チュートリアル
  - [vagrant編](https://github.com/y-sachou/hubot-tutorial/blob/master/vagrant/README.md)
  - [docker編](https://github.com/y-sachou/hubot-tutorial/blob/master/docker/README.md)
