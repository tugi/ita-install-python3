#!/bin/bash
mkdir -p py3
cd py3
wget https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tar.xz
tar xvf Python-3.6.1.tar.xz
cd Python-3.6.1
./configure
mkdir -p ~/usr/local
make altinstall prefix=$HOME/usr/local exec-prefix=$HOME/usr/local
cd ~/usr/local/bin
ln -s python3.6 python3
echo "export PATH=\$HOME/usr/local/bin:\$PATH" >> ~/.bashrc
cd -
cd ..
rm -rf py3/
cd ~/usr/local/bin
ln -s pyvenv-3.3 pyvenv
cd -
echo "=== DONE ==="
