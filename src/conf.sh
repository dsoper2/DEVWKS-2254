#!/usr/bin/env bash
sudo chown -R developer:developer /home/developer
cd ~/src

caddy run &

export PATH="$PATH:/home/developer/.dotnet:/home/developer/.dotnet/tools"
export DOTNET_ROOT="/home/developer/.dotnet"
dotnet tool install --global Microsoft.dotnet-interactive --version 1.0.506903
dotnet-interactive jupyter install

# fix for jupypter_server related errors
sudo pip install traitlets==5.9.0

jupyter notebook &
