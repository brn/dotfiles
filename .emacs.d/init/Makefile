ELISPS:=$(wildcard *.el)
BYTE_COMPILED_FILES=$(ELISPS:.el=.elc)

.SUFFIXES: .el .elc
.el.elc:
	for ELISP in $(ELISPS); do emacs --batch -f batch-byte-compile $${ELISP}; done

.PHONY: all
all: $(BYTE_COMPILED_FILES)

.PHONY: install
install:
	for FILE in $(BYTE_COMPILED_FILES); do\
		if [ -e $$FILE ]; then\
			mv $$FILE cmp/ > /dev/null 2>&1;\
		fi;\
	done
