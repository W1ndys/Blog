---
date: 2023-10-11 20:24
title: 全自动解密脚本Ciphey官方安装文档
tags: CTF
categories:
  - CTF
  - 工具
abbrlink: bc236d8e
---

# [Python 3.7 and above](https://github.com/Ciphey/Ciphey/wiki/Installation#python-37-and-above)

On Linux run this command:

```
python3 -m pip install ciphey --upgrade
```



This will tell your default Python3 version to install Ciphey and upgrade it if it already exists.

**Ciphey only supports Python3.7 and above. Please upgrade Python or use the Docker image if you have a version below 3.7.**

**⚠️ Ciphey doesn't work on Windows with Python 3.9+, use Python 3.7 or Python 3.8. Other platforms are fine with Python 3.9, Python 3.10 doesn't work.**

**⚠️ Windows Python defaults to install 32-bit. Ciphey only supports 64-bit. Make sure you're using 64-bit Python.**

# [Docker](https://github.com/Ciphey/Ciphey/wiki/Installation#docker)

[See here for how to install Docker](https://docs.docker.com/engine/install/)

```
docker run -it --rm remnux/ciphey
```



Our Docker image is maintained by [REMnux](https://remnux.org/). They have provided a guide on how to use it here. https://docs.remnux.org/run-tools-in-containers/remnux-containers#ciphey

# [Detailed Explanation for Python Installation](https://github.com/Ciphey/Ciphey/wiki/Installation#detailed-explanation-for-python-installation)

To install Ciphey, you need 2 core things:

1. Python3.7 or above
2. Pip (on Python 3)

Check to see if Python is already installed. Run both of these commands:

```
python -c "import sys; print(sys.version)"
```



And/or

```
python3 -c "import sys; print(sys.version)"
```



If Python is installed, one of these commands will run and will output the version number. Ciphey only supports numbers higher than 3.7. If you see "2" or anything below "3.7", we'll need to install a more up to date version.

Make sure to note what command words. On your computer, if `python -c "import sys; print(sys.version)"` returns something higher or equal to "3.7", then whenever you see `python3` instead write `python`.

**⚠️ Windows Warning ⚠️** On Windows? Python defaults to install 32-bit. Ciphey only supports 64-bit. When you download Python from the website on Windows it defaults to 32-bit. Make sure to download 64 bit!

Go to this website https://www.python.org/ and install Python3. Make sure the version is more than 3.7. By default, unless you explicitly choose a lower version, the version you install will > 3.7.

Next, we need to install **pip**.

Pip is already installed by default in Python. We just need to upgrade it.

**On Linux or Mac OS** run the command:

```
pip3 install -U pip
```



Making sure to replace `pip3` with `pip` if you had to replace `python3` with `python`.

**On Windows**

```
python -m pip install -U pip
```



If these commands didn't work, explore the official Pip guide for upgrading [here](https://pip.pypa.io/en/stable/installing/#upgrading-pip).

If you faced any errors with Pip, there's a nice troubleshooting guide on installing Pip [here](https://packaging.python.org/tutorials/installing-packages/).

## [Installing Ciphey](https://github.com/Ciphey/Ciphey/wiki/Installation#installing-ciphey)

Run this command:

```
python3 -m pip install -U ciphey
```



Replace `python3` with `python` if you need to. If you're not sure, read the previous section `Detailed Explanation`.

This command does many things:

- Uses Python3 (Ciphey only supports Python3.7 and above)
- The -m flag tells Python to run the module
- We are telling the version of pip inside Python3 to install something. The reason why we use Python3 to call Pip instead of calling Pip is that the version of Pip may differ from Python, or you may have multiple versions of Python installed or you may be in a virtual environment.
- The -U flag says "upgrade". Sometimes Python gets stuck on an older version of Ciphey, so if it does -- it says to upgrade it.
- "ciphey" is the name of the package we want to install.

**Make sure you run this command in Terminal/CMD/PowerShell or whatever you use. Do not run this in Python's IDLE.**



使用方法

ciphey -t ""