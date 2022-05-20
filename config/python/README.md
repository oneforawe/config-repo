# Python

## which

* In my GNU/Linux system:
  * which python => /usr/bin/python
  * which python2 => /usr/bin/python2
  * which python3 => /usr/bin/python3
  * /usr/bin/python -> python2
  * /usr/bin/python2 -> python2.7
  * /usr/bin/python3 -> python3.8
* In my MacOS system:
  * which python => /usr/bin/python
  * which python2 => /usr/bin/python2
  * which python3 => /usr/local/bin/python3 (?)
  * /usr/bin/python -> ../../System/Library/Frameworks/Python.framework/Versions/2.7/bin/python2.7
  * /usr/bin/python2 -> ../../System/Library/Frameworks/Python.framework/Versions/2.7/bin/python2.7
  * /usr/bin/python3  (not a link)  (?)
  * /usr/local/bin/python3 -> ../Cellar/python@3.9/3.9.12_1/bin/python3

## installing on work laptop

Python came pre-installed in the WSL Linux Ubuntu-20.04 system, but it didn't
have pip or pipenv..

* (INITIALLY) In work (Windows, WSL) GNU/Linux system:
  * which python => python not found
  * which python2 => python2 not found
  * which python3 => /usr/bin/python3
  * /usr/bin/python3 -> python3.8
  * which pip => pip not found
  * which pipenv => pipenv not found

We're supposed to be able to ensure pip is installed with the command
`python -m ensurepip --upgrade` but this doesn't work for me at first.  From
[this link](https://stackoverflow.com/questions/29871372/i-have-python3-4-but-no-pip-or-ensurepip-is-something-wrong-with-my-python3-4)
I find I need to use `apt-get install python3-pip`.

* (python already installed, but not pip or pipenv)
* `sudo apt-get update` (had to fix resolving errors...)
* `sudo apt-get install python3-pip`
