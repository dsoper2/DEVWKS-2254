FROM developenv/devenv-base-bootstrap-dind-vpn:latest

USER root

RUN rm -rf /home/developer/src

COPY src /home/developer/src

RUN chown -R developer: /home/developer

RUN apk add linux-headers libffi-dev nano
# .NET deps
RUN apk add bash icu-libs krb5-libs libgcc libintl libssl1.1 libstdc++ zlib

# RUN pip3 install -r /home/developer/src/requirements.txt

USER developer

# RUN . /home/developer/src/conf.sh
