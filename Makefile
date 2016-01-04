DIRS = $(wildcard docker-*)

.PHONY: build $(DIRS) update

build:
	@$(MAKE) update
	@$(MAKE) $(DIRS)
	@docker-compose up -d

update:
	@git submodule deinit --force .;  true
	@git submodule update --init --recursive

$(DIRS):
	@cd $@; $(MAKE)
