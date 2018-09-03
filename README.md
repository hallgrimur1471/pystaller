# Pystaller

Scripts for installing various versions of Python without conflicts.

## Ubuntu 16

### Installs:

* python2.7, 3.5, 3.6 & 3.7
* pip for each python version

### Features:

* `#!/usr/bin/env pythonX.X` will invoke `pythonX.X`
* `#!/usr/bin/env python` will invoke `python 2.7` (for maximum compatibility with legacy systems)
* `#!/usr/bin/env python2` will invoke `python2.7`
* `#!/usr/bin/env python3` will invoke `python3.5`
* `pip[X[.X]]` works in a similar way as the above

### Tests:

There is an integration test at `ubuntu_16/tests/test_install_python_ubuntu_16` which runs `ubuntu_16/install_python_ubuntu_16.sh` in an `ubuntu16.04` docker container which then runs a test to check if the installation works as expected.

## Windows

See README.md at `./windows`