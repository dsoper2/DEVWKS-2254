#!/usr/bin/env bash
sudo chown -R developer:developer /home/developer
cd ~/src

caddy run &

export PATH="$PATH:/home/developer/.dotnet:/home/developer/.dotnet/tools"
export DOTNET_ROOT="/home/developer/.dotnet"
dotnet tool install -g Microsoft.dotnet-interactive --version 1.0.317301
dotnet-interactive jupyter install

jupyter notebook &
