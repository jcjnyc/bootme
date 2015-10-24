#!/bin/bash
yum -y update
yum -y install git-all
git clone https://github.com/jcjnyc/bootme.git /tmp/bootme
cd /tmp/bootme
sh install.sh
