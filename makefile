# Makefile for Doxygen documentation generation

DOXYGEN = doxygen
DOXYFILE = Doxyfile
DOC_DIR = docs

.PHONY: all doc clean open

all: doc

doc:
	@echo "Generating documentation with Doxygen..."
	$(DOXYGEN) $(DOXYFILE)

clean:
	@echo "Cleaning documentation output..."
	rm -rf $(DOC_DIR)/*

open:
	@echo "Opening documentation in browser..."
	"$${BROWSER:-xdg-open}" $(DOC_DIR)/html/index.html