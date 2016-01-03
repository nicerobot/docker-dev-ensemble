DIRS = $(wildcard docker-*)

.PHONY: build $(DIRS)

build: $(DIRS)

$(DIRS):
	cd $@; $(MAKE)
