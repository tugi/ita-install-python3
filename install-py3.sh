#!/bin/bash

mkdir -p py3_temp
cd py3_temp/

#Download link, change if needed or outdated
wget https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tar.xz
tar xvf Python-3.6.1.tar.xz >> LOG
cd Python-3.6.1 

#Compile
./configure >> LOG
mkdir -p ~/usr/local
make altinstall prefix=$HOME/usr/local exec-prefix=$HOME/usr/local >> LOG

cd ~/usr/local/bin
ln -s python3.6 python3
ln -s pyvenv-3.3 pyvenv
ln -s pip-3.6 pip3
echo "export PATH=\$HOME/usr/local/bin:\$PATH" >> ~/.bashrc
#Change paths in scripts
sed -i -e 's@#!\/usr\/local\/bin@#!\'"$HOME"'\/usr\/local\/bin@g' pip3.6 pyvenv

#Cleanup
cd -
cd ..
rm -rf py3_temp/

#Reload Env
sh --dump-strings ~/.bashrc >> LOG
echo "=== DONE ==="