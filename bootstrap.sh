#!/usr/bin/env bash


# basics
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install tmux git


# Mini Anaconda
conda=Anaconda3-5.0.1-Linux-x86_64.sh

cd /vagrant
if [[ ! -f $conda ]]; then
	wget --quiet https://repo.continuum.io/archive/$conda
fi
bash $conda -b

echo 'export PATH=/home/vagrant/anaconda3/bin:$PATH' >> /home/vagrant/.bashrc
source /home/vagrant/.bashrc

PATH=/home/vagrant/anaconda3/bin:$PATH

conda config --append channels conda-forge
conda update --all --yes --quiet
conda install --yes numpy theano keras tensorflow scipy pyopengl jupyter jupyterlab cython


# # OpenAI
sudo apt-get install -y python-numpy python-dev cmake zlib1g-dev libjpeg-dev xvfb 
sudo apt-get install -y libav-tools xorg-dev python-opengl libboost-all-dev swig libsdl2-dev 
pip install gym
pip install gym[all]


# Apache

apt-get install -y apache2
if [[ ! -L /var/www]]; then
	rm -rf /var/www
	ln -fs /vagrant /var/www
fi