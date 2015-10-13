#!/bin/bash
yum -y install git-all
git clone https://github.com/jcjnyc/bootme.git
cd -v bootme 
git pull  
sh install.sh 


