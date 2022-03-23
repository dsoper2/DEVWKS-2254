#!/usr/bin/env bash
cd ~/src

caddy run &

# jupyter notebook and other reqs
python3 -m venv venv
. venv/bin/activate
pip install -r requirements.txt

# Create the target folder where powershell will be placed
sudo mkdir -p /opt/microsoft/powershell/7
# Expand powershell to the target folder
sudo tar zxf ./powershell.tar.gz -C /opt/microsoft/powershell/7
# Set execute permissions
sudo chmod +x /opt/microsoft/powershell/7/pwsh
# Create the symbolic link that points to pwsh
sudo ln -s /opt/microsoft/powershell/7/pwsh /usr/bin/pwsh
mkdir -p /home/developer/.local/share/powershell/Modules
sudo mv ./Intersight.PowerShell /home/developer/.local/share/powershell/Modules

# dotnet as jupyter notebook kernel
. dotnet-install.sh
dotnet tool install -g Microsoft.dotnet-interactive
export PATH="$PATH:/home/developer/.dotnet:/home/developer/.dotnet/tools"
export DOTNET_ROOT="/home/developer/.dotnet"
dotnet-interactive jupyter install

jupyter notebook &
