FROM centos:7

# yum update
RUN yum update -y

# setting environment
RUN yum reinstall -y glibc-common
ENV LANG ja_JP.UTF-8
ENV TZ Asia/Tokyo

# install rpms
RUN yum install -y epel-release vim
RUN yum install -y nodejs npm

# install npms
RUN npm install -g yo generator-hubot coffee-script hubot-chatwork

# setting hubot
RUN useradd -U -d /home/hubot -s /bin/bash -m hubot
USER hubot
RUN mkdir /home/hubot/bot
WORKDIR /home/hubot/bot
RUN yo hubot --owner "test" --name "hubot" --description "Hubot Chatwork" --adapter chatwork

# run hubot
# CMD cd /home/hubot/bot; bin/hubot -a chatwork
