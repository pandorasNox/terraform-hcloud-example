

UID:=$(shell id -u)
GID:=$(shell id -g)
PWD:=$(shell pwd)
UNAME_S=$(shell uname -s)


ifeq ($(UNAME_S),Linux)
	OS="LINUX"
	OPEN=x-www-browser
endif
ifeq ($(UNAME_S),Darwin)
	OS="OSX"
	OPEN=open
endif

