yum -y update

YUMLIST="
cronie
emacs
gcc
gcc-c++
git-all
gpg
gpgme
gpgme-devel
imake
jq
libgpg-error
lynx
mailx
mod24_ssl
mysql55
mysql55-common
mysql55-devel
mysql55-libs
mysql55-server
nagios
nagios-plugins-all
nano
nmap
openssl
perl-CPANPLUS
php55-cli
php55-common
php55-mbstring
php55-mcrypt
php55-mysqlnd
php55-pdo
php55-pecl-imagick
php55-pecl-memcache
php55-pecl-xdebug
php55-soap
php55-xml
php55-xmlrpc
php56-devel
php56-mbstring
php56-mcrypt
php56-mysqlnd
php56-pdo
php56-pgsql
php56-soap
php56-xml
php56-xmlrpc
vim
yum-cron-security
"

INSTALL=`echo $YUMLIST | sed 's/\n/ /'`
yum install -y $INSTALL

## INSTALL COMPOSER
if [ ! -e /usr/bin/composer ]; then
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
else
    /usr/bin/composer self-update
fi

## OSSEC
if [ ! -e /var/ossec ]; then
    git clone https://github.com/jcjnyc/ossec-agent /var/ossec
    echo 'New ossec agent key needs to be setup on server' | mail -s "Install new ossec agent key: ${HOSTNAME}" progynydev@gmail.com
    /var/ossec/bin/ossec-control restart
else
    echo '/var/ossec already installed'
    /var/ossec/bin/ossec-control restart
fi