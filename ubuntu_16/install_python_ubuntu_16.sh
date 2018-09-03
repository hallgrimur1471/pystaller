#!/usr/bin/env bash

# this script installs python2.7, python3.5, python3.6, python3.7, pip and pip3

# stop on errors
set -e

# display commands
set -x

if [[ "$1" == "--update=yes" ]]; then
  apt-get -y update
fi

# prerequisites
apt-get install -y build-essential libssl-dev libffi-dev

# install python 2.7 & pip
apt-get install -y python-dev python-pip

# install python 3.5 & pip
apt-get install -y python3-dev python3-pip

# install python 3.6 & pip
apt-get install -y software-properties-common # installs add-apt-repository
add-apt-repository ppa:deadsnakes/ppa
apt-get update
apt-get install -y python3.6
apt-get install -y python3.7

# install pip for all python versions.
# The order of lines is important here to pass the install test
apt-get install -y curl
curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
python3.7 /tmp/get-pip.py
python3.6 /tmp/get-pip.py
python3.5 /tmp/get-pip.py
python2.7 /tmp/get-pip.py
rm /tmp/get-pip.py
