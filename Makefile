IMAGENAME := "developenv/devenv-base-bootstrap-dind-vpn"
# IMAGENAME := "dsoper/devenv-base-bootstrap-dind-vpn"
VERSION := "latest"
INSTANCENAME := "devenv-base-bootstrap-dind-vpn"

build:
	@echo "Building image $(IMAGENAME)"
	docker build -t $(IMAGENAME) .
	docker tag "$(IMAGENAME):latest"  "$(IMAGENAME):$(VERSION)"
push:
	docker push $(IMAGENAME)
	docker push $(IMAGENAME):$(VERSION)
run: stop
	docker run --privileged --name $(INSTANCENAME) -d -p 1001:9090 -p 1002:9091 -p 1003:9092 -p 8888:8080 -e "DEVENV_PASSWORD=secret" -e "DEVENV_APP_URL=http://localhost:8080"  $(IMAGENAME)
	@echo "http://localhost:1001?arg=secret"

stop:
	docker stop  $(INSTANCENAME)  | true
	docker rm  $(INSTANCENAME)  | true

all: build run