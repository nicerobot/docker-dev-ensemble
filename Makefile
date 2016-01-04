DIRS = $(wildcard docker-*)

.PHONY: build $(DIRS)

build: $(DIRS)
	docker-compose up -d

$(DIRS):
	cd $@; $(MAKE)
