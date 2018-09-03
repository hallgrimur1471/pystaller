FROM ubuntu:16.04

WORKDIR /usr/local/install_python

# Copy everything from this Dockerfile's root-dir to WORKDIR
COPY . .

# Installs many Python versions
RUN ./install_python_ubuntu_16.sh --update=yes

# Tests if Python installed correctly
CMD ./tests/python_installation_tests/test_python_setup_linux.sh
