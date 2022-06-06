FROM developenv/devenv-base-bootstrap-dind-vpn:latest

USER root

RUN rm -rf /home/developer/src

COPY src /home/developer/src


RUN apk add linux-headers libffi-dev nano
# .NET deps
RUN apk add bash icu-libs krb5-libs libgcc libintl libssl1.1 libstdc++ zlib

# PowerShell Core
WORKDIR /home/developer/src
RUN mkdir -p /opt/microsoft/powershell/7
RUN tar zxf ./powershell.tar.gz -C /opt/microsoft/powershell/7
RUN chmod +x /opt/microsoft/powershell/7/pwsh
RUN ln -sf /opt/microsoft/powershell/7/pwsh /usr/bin/pwsh
RUN mkdir -p /home/developer/.local/share/powershell/Modules
RUN mv -n ./Intersight.PowerShell /home/developer/.local/share/powershell/Modules
RUN chown -R developer: /home/developer

# RUN pip3 install -r /home/developer/src/requirements.txt

USER developer
