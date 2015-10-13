sudo yum -y install git-all > /tmp/install.log 2>&1
git clone https://github.com/jcjnyc/bootme.git >> /tmp/install.log 2>&1
cd -v bootme >> /tmp/install.log 2>&1
git pull  >> /tmp/install.log 2>&1
sudo sh install.sh >> /tmp/install.log 2>&1


