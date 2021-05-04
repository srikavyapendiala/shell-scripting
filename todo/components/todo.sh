#!/bin/bash
source components/common.sh
REPEAT

NPM
HEAD "Clone code from github"
GIT_CLONE
STAT $?

HEAD "Install npm"
NPM_INSTALL
STAT $?

HEAD "Create service file"
vi /etc/systemd/system/todo.service
STAT $?

HEAD "Start Todo Service"
systemctl deamon-reload && systemctl satrt todo && systemctl status todo
STAT $?