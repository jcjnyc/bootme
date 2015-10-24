#!/bin/bash

## PACKAGE LIST
for i in `cat yum_list.txt`; do
    yum -y install ${i}
done
       
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
cd /usr/local/src/ossec-hids
git checkout v2.8.3


