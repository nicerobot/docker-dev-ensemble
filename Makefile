DIRS = $(patsubst %/,%,$(sort $(dir $(wildcard docker-*/*))))

.PHONY: build $(DIRS) update true-update yes-update 1-update false-update no-update 0-update up

UPDATE ?= yes

build:
	@$(MAKE) $(UPDATE)-update
	@$(MAKE) $(DIRS)
	@$(MAKE) up

yes-update 1-update true-update update:
	@mv docker-datastaxenterprise/*.run .; true
	@git submodule deinit --force .;  true
	@git submodule update --init --recursive
	@git submodule foreach --recursive 'git stash; git checkout master; git checkout 2.6.0 2>/dev/null; git pull; true'
	@git submodule foreach --recursive 'git branch; git status'
	@mv ./*.run docker-datastaxenterprise/; true

no-update 0-update false-update:

$(DIRS):
	@cd $@; $(MAKE)

up:
	@docker-compose up -d
