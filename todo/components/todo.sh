#!/bin/bash
source components/common.sh
REPEAT

NPM
HEAD "Clone code from github"
GIT_CLONE
STAT $?

HEAD "Install npm"
npm install
STAT $?

HEAD "Create service file"
vi /etc/systemd/system/todo.service
STAT $?

HEAD "Start Todo Service"
systemctl daemon-reload && systemctl satrt todo && systemctl status todo
STAT $?