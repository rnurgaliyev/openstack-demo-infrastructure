#!/bin/sh

sudo dpkg -i *.deb
sudo systemctl stop midonet-cluster.service
sudo systemctl stop midolman.service

ps ax | grep mido

sudo systemctl start midonet-cluster.service
sudo systemctl start midolman.service