MAKEFLAGS += -rR -s --include-dir=$(CURDIR)

.PHONY: bash-my-gcp bash-my-kubes all pass openstack-utils update help
SHELL = /bin/bash
.DEFAULT_GOAL = help

help:
	@echo -ne "\nTargets:\n\nall    \t\t - Everything below\n"
	@egrep '^(.+)\:\ #\ (.+)' Makefile |column -t -c 2 -s ':#'
	@echo ""

all: bash-my-gcp bash-my-kubes pass openstack-utils

bash-my-gcp: # - Install bash-my-gcp
	@$(MAKE) -C bash-my-gcp
bash-my-kubes: # - install bash-my-kubes
	@$(MAKE) -C bash-my-kubes

pass: # - Install pass
	@sudo $(MAKE) -C password-store install

openstack-utils: # - Install openstack tools ( requires pip )
	@pip install -r openstack-client_requirements.txt

update: # - Update the submodules in this repo
	@git submodule update --init --recursive
	@git submodule foreach git pull --recurse-submodules origin master
