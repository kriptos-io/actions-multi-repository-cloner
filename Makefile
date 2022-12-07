.ONESHELL:
%:
	@: > /dev/null 
-include ${ENV}.env
export
SHELL=/bin/bash
SOURCES := $(shell find ./scripts -name '*.sh' | sed  "s/.\/scripts\///g" | sed "s/.sh//g")
LIST=$(filter-out $@,$(MAKECMDGOALS))
LISTARGS=$(word 1, $(MAKECMDGOALS))
.PHONY: @(SOURCES)
target=$(word 1, $(MAKECMDGOALS))
action=$(word 2, $(MAKECMDGOALS))
region=$(word 3, $(MAKECMDGOALS))
secretName=$(word 4, $(MAKECMDGOALS))
$(SOURCES) &:
	@:
	@ . ./scripts/printer.sh
	@ . ./scripts/$(target).sh && ${action} ${region} ${secretName}|| true
