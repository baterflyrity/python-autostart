# Python Autostart

Docker images pack with autostart feature and preinstalled python.

Each container contains preinstalled python with tag version, e.g. *baterflyrity/python-autostart:3.12* = *python:3.12*.

### Add commands to autostart

Command can be added by two ways:

- update script at *autostart.sh*
- define environment variable *AUTOSTART* (`:` can be used to separate different commands)
- define environment variable prefixed *AUTOSTART_* (`:` can be used to separate different commands)

# Usage example

Echo something on start:

```bash
docker run -it --rm -e "AUTOSTART=echo 'Hello, world!'" baterflyrity/python-autostart
```

> Running echo 'Hello, world!'  
> Hello, world!  
> / # exit


Run two commands on start in container with python 3.11:

```bash
docker run -it --rm -e "AUTOSTART=echo 'Hello, world!': echo 'Still running.'" baterflyrity/python-autostart:3.11
```

> Running echo 'Hello, world!'  
> Hello, world!  
> Running echo 'Still running.'  
> Still running.  
> / # exit


Prestart some services via different environment variable and execute command:

```bash
docker run -it --rm -e "AUTOSTART_SERVICE1=echo 'Service 1 started.'" -e "AUTOSTART_SERVICE2=echo 'Service 2 started.'" baterflyrity/python-autostart python3 -V
```

> Running echo 'Service 1 started.'  
> Service 1 started.  
> Running echo 'Service 2 started.'  
> Service 2 started.  
> Python 3.11.2


# Building from sources

Requirements:

* docker
* python3.11+
* git

```bash
git clone https://github.com/baterflyrity/python-autostart.git
cd  python-autostart
python3.11 -m pip install -r requirements.txt
python3.11 builder.py make --image python:3.8-alpine --image python:3.9-alpine --image python:3.10-alpine --image python:3.11-alpine --image python:3.12-alpine --image python:alpine --image python:3.8 --image python:3.9 --image python:3.10 --image python:3.11 --image python:3.12 --image python:latest
python3.11 builder.py build --user baterflyrity # insert your username
# optionally upload to dockerhub
python3.11 builder.py push
```

# See also

* [baterflyrity/pythonssh](https://hub.docker.com/r/baterflyrity/pythonssh) - docker image with preinstalled ssh server (sshd) and python.

# Changelog

**1.1.1**
 * Add debian based images.
 * Add python 3.12 images.
 * Small builder fixes.

**1.1.0**
 * Add support for *AUTOSTART_...* environment variables.
 * Update examples.
