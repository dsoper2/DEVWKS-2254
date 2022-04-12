#!/usr/bin/env bash
cd ~/src

caddy run &

# jupyter notebook and other reqs
python3 -m venv venv
. venv/bin/activate
pip install -r requirements.txt

# dotnet as jupyter notebook kernel
. dotnet-install.sh
dotnet tool install -g Microsoft.dotnet-interactive
export PATH="$PATH:/home/developer/.dotnet:/home/developer/.dotnet/tools"
export DOTNET_ROOT="/home/developer/.dotnet"
dotnet-interactive jupyter install

jupyter notebook &
