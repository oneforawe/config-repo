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

Python docs/guide:

* [Install Pyton3](https://docs.python-guide.org/starting/install3/linux/)
* [Pipenv and Virtual Environments](https://docs.python-guide.org/dev/virtualenvs/#virtualenvironments-ref)

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
I initially found I needed to use `apt-get install python3-pip`.

* (python already installed, but not pip or pipenv)
* `sudo apt-get update` (had to fix resolving errors, or wait for them to
  randomly not be present...)
* Install pip  
  `sudo apt-get install python3-pip`  
  which pip => /usr/bin/pip
  pip --version =>  
  pip 20.0.2 from /usr/lib/python3/dist-packages/pip (python 3.8)
* Install pipenv  
  `pip install --user pipenv`  
  which pipenv => ~/.local/bin/pipenv  
  pipenv --version => pipenv, version 2022.5.2  
  python3 -m site --user-base => ~/.local
* This seems to be all I need to do, but for further consideration...
  * virtualenv
    * a tool to create isolated Python environments
    * creates a folder containing all necessary executables to use the packages
    that a Python project needs
    * can be used standalone, in place of pipenv.
    * Usage example: `virtualenv venv`  
      (where venv is a standard name for the folder containing the python
      executable files)
  * virtualenvwrapper
    * provides commands that make working with virtual environments more pleasant
    * places all virtual environments in one place (GOOD!)
  * virtualenv-burrito
    * provides a virtualenv + virtualenvwrapper environment in a single command
  * direnv
    * When you cd into a directory containing a .env, direnv automagically
    activates the environment.

### Usage Notes

* Install other versions of python.
  * `sudo apt-get update && sudo apt-get install python3.x`
* Check environment.
  * If using `virtualenv venv` (to initialize) and `source venv/bin/activate`
  and `deactivate`  
    `echo $VIRTUAL_ENV`
  * If using `pipenv shell` (to initialize and activate) and `exit`  
    `pipenv --venv`  
    `echo $VIRTUAL_ENV`
