MAKEFLAGS += -rR -s --include-dir=$(CURDIR)

.PHONY: bash-my-gcp bash-my-kubes
SHELL = /bin/bash


help:
	@echo -ne "\nTargets:\n \
		update \t\t\t- Update all Submodules\n \
		all \t\t\t- Install everything below\n \
		bash-my-gcp \t\t- Install bash-my-gcp\n \
		bash-my-kubes \t\t- Install bash-my-kubes \
		\n\n"

all: bash-my-gcp bash-my-kubes


bash-my-gcp:
	@$(MAKE) -C bash-my-gcp
bash-my-kubes:
	@$(MAKE) -C bash-my-kubes

update:
	@git submodule update --init --recursive
	@git submodule foreach git pull --recurse-submodules origin master
