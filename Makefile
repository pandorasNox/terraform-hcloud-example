

include ./hack/help.mk
include ./hack/vars.mk


DIRNAME:=$(shell basename "$(PWD)")
CONTAINER_IMG_NAME=$(DIRNAME)_terraform
CONRAINER_MANIFEST_PATH=container-images/terraform/Dockerfile
CONTAINER_DEFAULT_PORTS=-p 8000:8000
# CONTAINER_OPTS=-v "$(PWD):/code" -w "/code" -v "$(PWD)/.elm_home/:/tmp/.elm" -e "ELM_HOME=/tmp/.elm" -u "$(UID):$(GID)"
CONTAINER_OPTS=-v "$(PWD):/code" -w "/code" -u "$(UID):$(GID)"


# # docker ps -a --no-trunc --filter name=^/nervous_robinson$
# # docker ps | awk '{print $NF}' | grep -w foo
# # docker ps -a | awk '{print $NF}' | grep -w "$containerName" | cat
# .PHONY: setup
# setup: ##@ulist
# 	#if container not running - docker run -d sleep infinity
# 	if [ -z `docker ps -q --no-trunc | grep $$(docker-compose ps -q cli)` ]; then \
# 		docker-compose up -d cli; \
# 	fi;


.PHONY: img-build
img-build: ##@ulist
	# docker build --target build-dist
	docker build \
	--stream -t $(CONTAINER_IMG_NAME) -f ${CONRAINER_MANIFEST_PATH} .


# TODO: stand-alone cli -vs- attached cli
.PHONY: cli
cli: ##@dev provide docker based environment with elm tooling
	docker run -it --rm $(CONTAINER_OPTS) $(CONTAINER_DEFAULT_PORTS) --entrypoint="sh" ${CONTAINER_IMG_NAME}

