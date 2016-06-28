#!/bin/sh

echo "rpm update..."
sudo yum update -y

echo "setting environment..."
sudo timedatectl set-timezone Asia/Tokyo

echo "install rpms..."
sudo yum install -y epel-release
sudo yum install -y nodejs npm

echo "install npms..."
sudo npm install -g coffee-script hubot yo generator-hubot hubot-chatwork

echo "setting hubot..."
sudo useradd -U -d /home/hubot -s /bin/bash -m hubot
sudo -u hubot mkdir /home/hubot/bot
cd /home/hubot/bot
sudo -u hubot yo hubot --owner "test" --name "hubot" --description "Hubot Chatwork" --adapter chatwork

echo "Finish"
