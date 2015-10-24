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
php-pear.noarch
php56.x86_64
php56-cli.x86_64
php56-common.x86_64
php56-devel.x86_64
php56-gd.x86_64
php56-intl.x86_64
php56-mbstring.x86_64
php56-mcrypt.x86_64
php56-mysqlnd.x86_64
php56-pdo.x86_64
php56-pecl-igbinary.x86_64
php56-pecl-imagick.x86_64
php56-pecl-jsonc.x86_64
php56-pecl-jsonc-devel.x86_64
php56-pecl-memcache.x86_64
php56-pecl-redis.x86_64
php56-pgsql.x86_64
php56-process.x86_64
php56-soap.x86_64
php56-xml.x86_64
php56-xmlrpc.x86_64
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
if [ -d /var/ossec ]; then
    rm -rf /var/ossec
fi
if [ -d /tmp/ossec-hids ]; then
    rm -rf /tmp/ossec-hids
fi
git clone https://github.com/ossec/ossec-hids.git /usr/local/src/ossec-hids
git checkout v2.8.3


