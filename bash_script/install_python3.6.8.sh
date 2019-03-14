#!/bin/bash
yum -y install gcc openssl-devel bzip2-devel libffi-devel nss curl libcurl
cd /tmp
curl -O https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tgz
tar zxvf Python-3.6.8.tgz
cd Python-3.6.8
./configure --enable-optimizations --with-ssl && make altinstall
rm -rf /tmp/Python*


tee -a ~/.zshrc <<EOM
alias python="/usr/local/bin/python3.6"
alias pip="/usr/local/bin/pip3.6"
EOM
source ~/.zshrc

pip install --upgrade pip

echo "Python-3.6.8 Install Done!!"
