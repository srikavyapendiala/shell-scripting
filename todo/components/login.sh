#!/bin/bash

source components/common.sh
Head "Set Hostname and Update Repo"
REPEAT
STAT $?

Head "Install Go Lang"
wget -c https://dl.google.com/go/go1.15.5.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local
STAT $?

Head "Set path variables"
export PATH=$PATH:/usr/local/go/bin
source ~/.profile
go version
STAT $?

Head "Make directory"
cd /go && cd src || exit
STAT $?

GIT_CLONE
STAT $?

Head " Build the Source-code"
export GOPATH=~/go &>>$LOG
depmod && apt install go-dep &>>$LOG
cd login
dep ensure && go get &>>$LOG && go build &>>$LOG
Stat $?

Head "Build"
go build &>>"${LOG}"
STAT $?

Head "Create login service file"
mv /root/shell-scripting-todo/todo/todo/systemd.service /etc/systemd/system/login.service

HEAD "Replace Ip with DNS Names"
sed -i -e 's/Environment=USERS_API_ADDRESS=http://172.31.17.148:8080/Environment=USERS_API_ADDRESS=users.kavya.website:8080/g' /etc/systemd/system/login.service

Head "Start login service"
systemctl daemon-reload && systemctl start login && systemctl status login
STAT $?

